module Pages.User.Update exposing (..)

import Pages.User.Model exposing (..)
import Pages.User.Messages exposing (..)


update : Msg -> User -> ( User, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
