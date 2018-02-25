module Pages.CreateEvent.Messages exposing (..)
import Pages.Event.Model exposing(..)



type Msg
    = SubmitEvent
    | GotResponse ResponseModel
    | GotSubmitResponse SubmitResponseModel
    | MakeRequest
    | ChangeName String
    | ChangeNameFull String
