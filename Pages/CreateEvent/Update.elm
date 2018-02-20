module Pages.CreateEvent.Update exposing (..)

import SeatGeek.Types as SG
import Pages.CreateEvent.Model exposing (..)
import Pages.CreateEvent.Messages exposing (..)


update : Msg -> CreateEvent -> ( CreateEvent, Cmd Msg )
update msg model =
    case msg of
        SubmitEvent e ->
            ( model , Cmd.none )
        ChangeTitle newTitle ->
            ( { model | title = newTitle }, Cmd.none)
        ChangeDescription newDescription ->
            ( { model | description = newDescription}, Cmd.none)
        ChangeLocation newLocation ->
            ( { model | location = newLocation }, Cmd.none)
        ChangeDate newDate ->
            ( { model | date = newDate }, Cmd.none)
        ChangeTime newTime ->
            ( { model | time = newTime }, Cmd.none)
        ChangePrivacy newPrivacy ->
            ( { model | privacy = newPrivacy }, Cmd.none)
        ChangeTaxonomy newTaxonomy ->
            ( { model | taxonomy = newTaxonomy }, Cmd.none)
