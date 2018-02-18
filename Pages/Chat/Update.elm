module Pages.Chat.Update exposing (..)

import Pages.Chat.Model exposing (..)
import Pages.Chat.Messages exposing (..)


update : Msg -> Chat -> ( Chat, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
