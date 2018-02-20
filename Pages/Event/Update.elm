module Pages.Event.Update exposing (..)

import SeatGeek.Types as SG
import Pages.Event.Model exposing (..)
import Pages.Event.Messages exposing (..)


update : Msg -> Event -> ( Event, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
