module Pages.Events.Model exposing (..)

import Date exposing (..)
import Pages.Events.Messages exposing (..)
import SeatGeek.Types as SG


type alias Events =
    { seatgeek : Maybe SG.Reply
    , currentDatetime : Maybe Date
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
    }
