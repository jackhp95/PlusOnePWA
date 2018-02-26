module Pages.Events.Update exposing (..)

import Pages.Events.Messages exposing (..)
import Pages.Events.Model exposing (..)
import SeatGeek.Types as SG


update : Msg -> Events -> ( Events, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
