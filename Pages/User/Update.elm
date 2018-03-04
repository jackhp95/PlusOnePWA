module Pages.User.Update exposing (..)

import Pages.User.Messages exposing (..)
import Pages.User.Model exposing (..)


update : Msg -> UserModel.UserModel -> ( UserModel.UserModel, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
