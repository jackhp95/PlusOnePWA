module Pages.Chats.Update exposing (..)

import Pages.Chats.Messages exposing (..)
import Pages.Chats.Model exposing (..)


update : Msg -> Chats -> ( Chats, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
