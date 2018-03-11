module Pages.CreateEvent.Messages exposing (..)

import Pages.Event.Model exposing (..)


type Msg
    = SubmitEvent
    | GotSubmitResponse SubmitResponseModel
    | ChangeName String
    | ChangeNameFull String
    | ChangeStartDate String
    | ChangeEndDate String
