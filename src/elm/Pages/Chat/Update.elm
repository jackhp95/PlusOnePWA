module Pages.Chat.Update exposing (..)

import Pages.Chat.Messages exposing (..)
import Pages.Chat.Model exposing (..)
import Pages.User.Model exposing (Me)


update : Msg -> Chat -> Me -> ( Chat, Cmd Msg )
update msg model me =
    case msg of
        -- ( { model | input = newInput }, Cmd.none )
        SendChatMessage ->
            ( model, Cmd.none )
