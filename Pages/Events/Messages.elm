module Pages.Events.Messages exposing (..)
import Pages.Event.Model exposing(ResponseModel)


type Msg
    = MakeRequest
    | GotResponse ResponseModel
