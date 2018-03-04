module Pages.CreateEvent.Model exposing (..)

import Date exposing (Date)
import Pages.CreateEvent.Messages exposing (..)
import Pages.Event.Model
import RemoteData exposing (..)
import Time exposing (Time)


type alias CreateEvent =
    Pages.Event.Model.EventModel


init : ( CreateEvent, Cmd Msg )
init =
    ( Pages.Event.Model.initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none



-- initModel : CreateEvent
-- initModel =
--     CreateEvent
--         ""
--         ""
--         ""
--         ""
--         ""
--         ""
--         ""
