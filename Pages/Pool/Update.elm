module Pages.Pool.Update exposing (..)

import SeatGeek.Types as SG
import Pages.Pool.Model exposing (..)
import Pages.Pool.Messages exposing (..)


update : Msg -> Pool -> ( Pool, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
