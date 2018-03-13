module Pages.CreateChat.Update exposing (..)

import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as User
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Pages.Chat.Model exposing (..)
import Pages.CreateChat.Messages exposing (..)
import Pages.CreateChat.Model exposing (..)
import RemoteData exposing (..)


update : Msg -> CreateChat -> ( CreateChat, Cmd Msg )
update msg model =
    case msg of
        MutateCreateChat ->
            let
                poolId =
                    model.poolId

                initiatedId =
                    model.initiatedId

                recipientId =
                    model.recipientId
            in
            ( model, makeRequest poolId initiatedId recipientId )

        GotCreateResponse response ->
            ( { model | createResponse = response }, Cmd.none )


mutation : Id -> Id -> Id -> SelectionSet (Maybe NewChat) RootMutation
mutation poolId iId rId =
    Mutation.selection identity
        |> with
            (Mutation.createChat
                (\optionals ->
                    { optionals
                        | poolId = Present poolId
                        , initiatedId = Present iId
                        , recipientId = Present rId
                    }
                )
                newChat
            )


newChat : SelectionSet NewChat GraphCool.Object.Chat
newChat =
    Chat.selection NewChat
        |> with (Chat.pool identity poolId)
        |> with (Chat.initiated identity userName)
        |> with (Chat.recipient identity userName)


userName : SelectionSet String GraphCool.Object.User
userName =
    User.selection identity |> with User.name


poolId : SelectionSet Id GraphCool.Object.Pool
poolId =
    Pool.selection identity |> with Pool.id


makeRequest : Id -> Id -> Id -> Cmd Msg
makeRequest eId iId rId =
    mutation eId iId rId
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotCreateResponse)
