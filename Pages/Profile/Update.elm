module Pages.Profile.Update exposing (..)

import Pages.Profile.Model exposing (..)
import Pages.Profile.Messages exposing (..)


update : Msg -> Profile -> ( Profile, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
