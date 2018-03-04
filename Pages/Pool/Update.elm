module Pages.Pool.Update exposing (..)

import Pages.Pool.Messages exposing (..)
import Pages.Pool.Model exposing (..)
import SeatGeek.Types as SG
import Pages.User.Model exposing (Me)


update : Msg -> Pool -> Me -> ( Pool, Cmd Msg )
update msg model me =
    case msg of
        Temp ->
            ( model, Cmd.none )
