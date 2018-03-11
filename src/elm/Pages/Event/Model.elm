module Pages.Event.Model exposing (..)

-- import Graphqelm.SelectionSet exposing (SelectionSet, with)
-- import GraphCool.Object.Event as Event
-- import GraphCool.Query as Query
-- import Graphqelm.Operation exposing (RootQuery)
-- import GraphCool.Object

import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Pages.Event.Messages exposing (..)
import RemoteData exposing (..)
import Pages.Pool.Model exposing(Pool)


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
    { events : List Event
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
    , venues : Maybe (List Id)
    , pool : Pool
    }

type alias NewEvent =
    { createdBy : Id
    , endsAt : Maybe DateTime
    , name : String
    , nameFull : Maybe String
    , startsAt : DateTime
    }


type alias EventModel =
    { event : Event
    , createdEvent : SubmitResponseModel
    }


type alias ResponseModel =
    RemoteData Graphqelm.Http.Error Response


type alias SubmitResponseModel =
    RemoteData Graphqelm.Http.Error (Maybe NewEvent)


init : ( EventModel, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initEvent : Event
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
        Pages.Pool.Model.initModel

initModel : EventModel
initModel =
    EventModel
        initEvent
        RemoteData.Loading
