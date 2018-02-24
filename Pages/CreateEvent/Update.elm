module Pages.CreateEvent.Update exposing (..)

import SeatGeek.Types as SG
import Pages.CreateEvent.Model exposing (..)
import Pages.CreateEvent.Messages exposing (..)
-- import Pages.Event.Model exposing (Event)
-- import Graphqelm.Operation exposing (RootQuery)
-- import Graphqelm.SelectionSet exposing (SelectionSet, with)
-- import GraphCool.Object.Event as Event
-- import GraphCool.Object
-- import RemoteData exposing (..)
-- import GraphCool.Query as Query
-- import Graphqelm.Http exposing (..)
--
--
--
-- query : SelectionSet Response RootQuery
-- query =
--     Query.selection Response
--         |> with (Query.allEvents event)
--
-- event : SelectionSet EventQuery GraphCool.Object.Event
-- event =
--     Event.selection EventQuery
--         -- |> with Event.chats
--         -- |> with Event.createdAt
--         -- |> with Event.createdBy
--         -- |> with Event.endsAt
--         -- |> with Event.hosts
--         |> with Event.name
--         |> with Event.id
--         -- |> with Event.nameFull
--         -- |> with Event.private
--         -- |> with Event.startsAt
--         -- |> with Event.usersAttending
--         -- |> with Event.usersLiked
--         -- |> with Event.usersViewed
--         -- |> with Event.venues
--
-- -- { chats : List String
-- -- , createAt : GraphCool.Scalar.DateTime
-- -- , createdBy : String
-- -- , endsAt : GraphCool.Scalar.DateTime
-- -- , hosts : List String
-- -- , id : GraphCool.Scalar.Id
-- -- , name : String
-- -- , nameFull : String
-- -- , private : Bool
-- -- , startsAt : GraphCool.Scalar.DateTime
-- -- , usersAttending : List String
-- -- , usersLiked : List String
-- -- , usersViewed : List String
-- -- , venues : List String
-- -- }
--
-- makeRequest : Cmd Msg
-- makeRequest =
--     query
--         |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
--         |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)

update : Msg -> CreateEvent -> ( CreateEvent, Cmd Msg )
update msg model =
    case msg of
        MakeRequest ->
            (model, makeRequest)
        GotResponse responseModel ->
            ({ model | eventResponse = responseModel}, Cmd.none)
        SubmitEvent e ->
            ( model , Cmd.none )
        -- ChangeTitle newTitle ->
        --     ( { model | title = newTitle }, Cmd.none)
        -- ChangeDescription newDescription ->
        --     ( { model | description = newDescription}, Cmd.none)
        -- ChangeLocation newLocation ->
        --     ( { model | location = newLocation }, Cmd.none)
        -- ChangeDate newDate ->
        --     ( { model | date = newDate }, Cmd.none)
        -- ChangeTime newTime ->
        --     ( { model | time = newTime }, Cmd.none)
        -- ChangePrivacy newPrivacy ->
        --     ( { model | privacy = newPrivacy }, Cmd.none)
        -- ChangeTaxonomy newTaxonomy ->
        --     ( { model | taxonomy = newTaxonomy }, Cmd.none)
