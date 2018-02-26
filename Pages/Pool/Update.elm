module Pages.Pool.Update exposing (..)

import Pages.Pool.Messages exposing (..)
import Pages.Pool.Model exposing (..)
import SeatGeek.Types as SG


update : Msg -> Pool -> ( Pool, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
