module Pages.CreateEvent.Messages exposing (..)
import Pages.Event.Model exposing(Event)
import RemoteData exposing (..)
import Graphqelm.Http exposing (..)


type alias Response =
  {
    events: List Event
  }

type alias ResponseModel =
     RemoteData Graphqelm.Http.Error Response

type Msg
    = SubmitEvent String
    | ChangeTitle String
    | ChangeDescription String
    | ChangeLocation String
    | ChangeDate String
    | ChangeTime String
    | ChangePrivacy String
    | ChangeTaxonomy String
    | GotResponse ResponseModel
