module Pages.Events.Update exposing (..)

import Pages.Events.Messages exposing (..)
import Pages.Events.Model exposing (..)
import SeatGeek.Types as SG
import Pages.User.Model exposing (Me)


update : Msg -> Events -> Me -> ( Events, Cmd Msg )
update msg model me =
    case msg of
        Temp ->
            ( model, Cmd.none )
