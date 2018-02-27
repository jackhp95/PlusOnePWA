module Pages.Events.Model exposing (..)
import Pages.Events.Messages exposing (..)
import SeatGeek.Types as SG
import Date exposing (..)
import Pages.Event.Model exposing(ResponseModel)
import RemoteData exposing(..)


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
