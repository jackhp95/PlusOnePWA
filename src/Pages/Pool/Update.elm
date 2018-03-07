module Pages.Pool.Update exposing (..)

import Pages.Pool.Messages exposing (..)
import Pages.Pool.Model exposing (..)
import Pages.User.Model exposing (Me)
import SeatGeek.Types as SG


update : Msg -> Pool -> Me -> ( Pool, Cmd Msg )
update msg model me =
    case msg of
        Temp ->
            ( model, Cmd.none )
