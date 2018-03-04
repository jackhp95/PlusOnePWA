module Pages.Event.Update exposing (..)

import Pages.Event.Messages exposing (..)
import Pages.Event.Model exposing (..)
import SeatGeek.Types as SG
import Pages.User.Model exposing (Me)


update : Msg -> Event -> Me -> ( Event, Cmd Msg )
update msg model me =
    case msg of
        Temp ->
            ( model, Cmd.none )
