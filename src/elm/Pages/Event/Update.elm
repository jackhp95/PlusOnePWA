module Pages.Event.Update exposing (..)

import Pages.Event.Messages exposing (..)
import Pages.Event.Model exposing (..)
import Pages.Pool.Model exposing (PoolModel,AttendResponse)
import Pages.User.Model exposing (Me)
import SeatGeek.Types as SG
import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as User
import GraphCool.Object.AddToAttendingEventPayload as AddToAttendingEventPayload
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import RemoteData exposing (..)


update : Msg -> PoolModel -> Me -> ( PoolModel, Cmd Msg )
update msg model me =
    case msg of
        AddToPool ->
            ( model, makeAttendRequest )
        GotAttendResponse response ->
            ( {model | attendConfirm = response}, Cmd.none )

mutation : SelectionSet (Maybe AttendResponse) RootMutation
mutation =
    Mutation.selection identity
        -- (Maybe Event)
        |> with
            (Mutation.addToAttendingEvent
                --identity
                { attendingUserId = Id"cjed2224jh6a4019863siiw2e",attendingEventPoolId = Id"cjedb15btjs2m018425xmd99d" }
                attendingEvent
            )

attendingEvent : SelectionSet AttendResponse GraphCool.Object.AddToAttendingEventPayload
attendingEvent = 
    AddToAttendingEventPayload.selection AttendResponse
        |> with (AddToAttendingEventPayload.attendingUser userName)
        |> with (AddToAttendingEventPayload.attendingEventPool poolId)
    
poolId : SelectionSet Id GraphCool.Object.Pool
poolId =
    Pool.selection identity |> with Pool.id

userName : SelectionSet String GraphCool.Object.User
userName =
    User.selection identity |> with User.name

makeAttendRequest : Cmd Msg
makeAttendRequest =
    mutation
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotAttendResponse)