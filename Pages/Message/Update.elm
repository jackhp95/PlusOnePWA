module Pages.Message.Update exposing (..)

import Pages.Message.Messages exposing (..)
import Pages.Message.Model exposing (..)


update : Msg -> Message -> ( Message, Cmd Msg )
update msg model =
    case msg of
        -- ( { model | input = newInput }, Cmd.none )
        SendChatMessage ->
            ( model, Cmd.none )
