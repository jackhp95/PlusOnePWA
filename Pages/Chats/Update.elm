module Pages.Chats.Update exposing (..)

import Pages.Chats.Messages exposing (..)
import Pages.Chats.Model exposing (..)


update : Msg -> Chats -> Me -> ( Chats, Cmd Msg )
update msg model me =
    case msg of
        Temp ->
            ( model, Cmd.none )
