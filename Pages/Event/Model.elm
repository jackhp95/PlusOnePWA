module Pages.Event.Model exposing (..)
import Pages.Event.Messages exposing (..)
import GraphCool.Scalar exposing (..)
import RemoteData exposing (..)

-- import Graphqelm.SelectionSet exposing (SelectionSet, with)
-- import GraphCool.Object.Event as Event
-- import GraphCool.Query as Query
-- import Graphqelm.Operation exposing (RootQuery)
-- import GraphCool.Object
import Graphqelm.Http exposing (..)



-- type alias Event =
--     { chats : List String
--     , createAt : GraphCool.Scalar.DateTime
--     , createdBy : String
--     , endsAt : GraphCool.Scalar.DateTime
--     , hosts : List String
--     , id : GraphCool.Scalar.Id
--     , name : String
--     , nameFull : String
--     , private : Bool
--     , startsAt : GraphCool.Scalar.DateTime
--     , usersAttending : List String
--     , usersLiked : List String
--     , usersViewed : List String
--     , venues : List String
--     , eventResponse: ResponseModel
--     }

type alias Response =
  {
    events: List Event
  }
type alias Event =
    { chats : Maybe (List Id)
    , createdAt : DateTime
    , createdBy : Id
    , endsAt : Maybe DateTime
    , hosts : Maybe (List Id)
    , id : Id
    , name : String
    , nameFull : Maybe String
    , private : Bool
    , startsAt : DateTime
    , usersAttending : Maybe (List Id)
    , usersLiked : Maybe (List Id)
    , usersViewed : Maybe (List Id)
    , venues : Maybe (List Id)
    }

type alias EventModel =
   { event: Event
   , eventResponse: ResponseModel
   , createdEvent:  SubmitResponseModel
   }

type alias ResponseModel =
     RemoteData Graphqelm.Http.Error Response

type alias SubmitResponseModel =
    RemoteData Graphqelm.Http.Error (Maybe Event)

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


init : ( EventModel, Cmd Msg )
init =
    ( initModel, initCmd )

initCmd : Cmd Msg
initCmd =
    Cmd.none

initEvent: Event
initEvent =
    Event
        Nothing
        (GraphCool.Scalar.DateTime "10/10/10")
        (Id "")
        Nothing
        Nothing
        (GraphCool.Scalar.Id "12345")
        ""
        Nothing
        False
        (GraphCool.Scalar.DateTime "10/11/10")
        Nothing
        Nothing
        Nothing
        Nothing


initModel : EventModel
initModel =
    EventModel
      initEvent
      RemoteData.Loading
      RemoteData.Loading
