module Pages.CreateChat.Update exposing (..)

import Pages.Chat.Model exposing (..)
import Pages.CreateChat.Model exposing (..)
import Pages.CreateChat.Messages exposing (..)
import RemoteData exposing (..)
import Graphqelm.Http exposing (..)
import GraphCool.Object
import GraphCool.Object.User as User
import GraphCool.Object.Event as Event
import GraphCool.Object.Chat as Chat
import GraphCool.Mutation as Mutation
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)


update : Msg -> CreateChat -> ( CreateChat, Cmd Msg )
update msg model =
    case msg of
        MutateCreateChat ->
            let
                eventId = model.eventId
                initiatedId = model.initiatedId
                recipientId = model.recipientId
            in
                ( model, makeRequest eventId initiatedId recipientId)
                
        GotCreateResponse response->
            ( { model | createResponse = response}, Cmd.none )

mutation : Id -> Id -> Id -> SelectionSet (Maybe NewChat) RootMutation
mutation eId iId rId = 
    Mutation.selection identity 
        |> with (Mutation.createChat
                    (\optionals -> {optionals 
                                    | eventId = Present eId
                                    , initiatedId = Present iId
                                    , recipientId = Present rId })
                    newChat
                )
 
newChat : SelectionSet NewChat GraphCool.Object.Chat
newChat =
    Chat.selection NewChat
        |> with ( Chat.event identity eventId)
        |> with ( Chat.initiated identity userName)
        |> with ( Chat.recipient identity userName)

userName : SelectionSet String GraphCool.Object.User
userName =
    User.selection identity |> with User.name

eventId : SelectionSet Id GraphCool.Object.Event
eventId =
    Event.selection identity |> with Event.id

makeRequest : Id -> Id -> Id -> Cmd Msg
makeRequest eId iId rId=
    mutation eId iId rId
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotCreateResponse)





