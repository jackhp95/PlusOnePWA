module Pages.Events.Update exposing (..)

import SeatGeek.Types as SG
import Pages.Events.Model exposing (..)
import Pages.Events.Messages exposing (..)


update : Msg -> Events -> ( Events, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
