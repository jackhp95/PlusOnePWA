module Pages.Chats.Update exposing (..)

import Pages.Chats.Model exposing (..)
import Pages.Chats.Messages exposing (..)


update : Msg -> Chats -> ( Chats, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
