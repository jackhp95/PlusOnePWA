module Pages.Chats.Update exposing (..)

import GraphCool.Enum.MessageOrderBy exposing (..)
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Message as Message
import GraphCool.Object.User as User
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Pages.Chat.Model exposing (Chat, Chatter)
import Pages.Chats.Messages exposing (..)
import Pages.Chats.Model exposing (..)
import Pages.Message.Model exposing (Message)
import Pages.User.Model exposing (Me)
import RemoteData exposing (..)


update : Msg -> Chats -> Me -> ( Chats, Cmd Msg )
update msg model me =
    case msg of
        MakeQueryRequest ->
            ( model, makeQueryRequest )

        GotQueryResponse response ->
            ( response, Cmd.none )



-- Query all messages and the name of the other user (message "from" field + query user)
-- from id: cjd16q3l8be6v0118ieszpf2b


query : SelectionSet Response RootQuery
query =
    Query.selection Response
        |> with
            (Query.user
                (\optionals -> { optionals | id = Present (Id "cjed2224jh6a4019863siiw2e") })
                user
            )


user : SelectionSet UserChats GraphCool.Object.User
user =
    User.selection UserChats
        |> with (User.initiated identity chat)
        |> with (User.recipient identity chat)


chat : SelectionSet Chat GraphCool.Object.Chat
chat =
    Chat.selection Chat
        |> with (Chat.canceled identity userName)
        |> with Chat.dateState
        |> with (Chat.event identity eventName)
        |> with Chat.id
        |> with (Chat.initiated identity chatter)
        |> with (Chat.messages (\optionals -> { optionals | orderBy = Present CreatedAt_ASC }) message)
        |> with (Chat.passed identity userName)
        |> with (Chat.proposed identity userName)
        |> with (Chat.recipient identity chatter)


chatter : SelectionSet Chatter GraphCool.Object.User
chatter =
    User.selection Chatter
        |> with User.id
        |> with User.name

message : SelectionSet Message GraphCool.Object.Message
message =
    Message.selection Message
        |> with (Message.chat identity chatId)
        |> with Message.createdAt
        |> with (Message.from identity userId)
        |> with Message.id
        |> with Message.text

chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
    Chat.selection identity |> with Chat.id


userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id


userName : SelectionSet String GraphCool.Object.User
userName =
    User.selection identity |> with User.name


eventName : SelectionSet String GraphCool.Object.Event
eventName =
    Event.selection identity |> with Event.name


makeQueryRequest : Cmd Msg
makeQueryRequest =
    query
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotQueryResponse)
