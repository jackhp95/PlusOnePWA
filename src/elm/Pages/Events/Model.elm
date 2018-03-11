module Pages.Events.Model exposing (..)

import Date exposing (..)
import Pages.Event.Model exposing (ResponseModel)
import Pages.Events.Messages exposing (..)
import RemoteData exposing (..)
import SeatGeek.Types as SG


type EventAPI
    = GraphCool Pages.Event.Model.Event
    | SeatGeek SG.Event


type alias Events =
    { seatgeek : Maybe SG.Reply
    , currentDatetime : Maybe Date
    , eventResponse : ResponseModel
    }


init : ( Events, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : Events
initModel =
    { seatgeek = Nothing
    , currentDatetime = Nothing
    , eventResponse = RemoteData.Loading
    }
