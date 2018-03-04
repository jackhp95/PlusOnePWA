module Pages.Message.Update exposing (..)

import Pages.Message.Messages exposing (..)
import Pages.Message.Model exposing (..)
import Pages.User.Model exposing (Me)


update : Msg -> Message -> Me -> ( Message, Cmd Msg )
update msg model me =
    case msg of
        -- ( { model | input = newInput }, Cmd.none )
        SendChatMessage ->
            ( model, Cmd.none )
