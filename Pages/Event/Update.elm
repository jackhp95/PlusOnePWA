module Pages.Event.Update exposing (..)

import Pages.Event.Messages exposing (..)
import Pages.Event.Model exposing (..)
import SeatGeek.Types as SG


update : Msg -> Event -> ( Event, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
