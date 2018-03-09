module Pages.CreateMessage.Update exposing (..)

import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Message as Message
import GraphCool.Object.User as User
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Pages.CreateMessage.Messages exposing (..)
import Pages.CreateMessage.Model exposing (..)
import Pages.Message.Model exposing (Message)
import RemoteData exposing (..)


update : Msg -> CreateMessage -> ( CreateMessage, Cmd Msg )
update msg model =
    case msg of
        -- ( { model | input = newInput }, Cmd.none )
        SendMessage ->
            if model.text == "" then
                ( model, Cmd.none )
            else
                let
                    input =
                        model.text
                in
                ( { model | text = "" }, makeSendRequest input model.chatId )

        GotSendResponse response ->
            ( { model | sendResponse = response }, Cmd.none )

        ChangeText newText ->
            ( { model | text = newText }, Cmd.none )


mutation : String -> Id -> SelectionSet (Maybe Message) RootMutation
mutation text id =
    Mutation.selection identity
        -- (Maybe Event)
        |> with
            (Mutation.createMessage
                --identity
                (\optionals -> { optionals | chatId = Present id, fromId = Present (Id "cjed2224jh6a4019863siiw2e") })
                { text = text }
                message
            )


message : SelectionSet Message GraphCool.Object.Message
message =
    Message.selection Message
        |> with (Message.chat identity chatId)
        |> with Message.createdAt
        |> with (Message.from identity userId)
        |> with Message.id
        |> with Message.text


userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id


chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
    Chat.selection identity |> with Chat.id


makeSendRequest : String -> Id -> Cmd Msg
makeSendRequest text id =
    mutation text id
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotSendResponse)
