module Pages.CreateEvent.Update exposing (..)

import SeatGeek.Types as SG
import Pages.CreateEvent.Model exposing (..)
import Pages.CreateEvent.Messages exposing (..)


update : Msg -> CreateEvent -> ( CreateEvent, Cmd Msg )
update msg model =
    case msg of
        Temp ->
            ( model, Cmd.none )
