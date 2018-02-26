module Pages.Chat.Update exposing (..)

import Pages.Chat.Messages exposing (..)
import Pages.Chat.Model exposing (..)


update : Msg -> Chat -> ( Chat, Cmd Msg )
update msg model =
    case msg of
        -- ( { model | input = newInput }, Cmd.none )
        SendChatMessage ->
            ( model, Cmd.none )
