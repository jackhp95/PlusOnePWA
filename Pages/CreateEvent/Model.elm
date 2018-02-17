module Pages.CreateEvent.Model exposing (..)
import Pages.CreateEvent.Messages exposing (..)

type alias CreateEvent =
    { name : String
    , other : String
    }


init : ( CreateEvent, Cmd Msg )
init =
    ( initModel, initCmd )

initCmd : Cmd Msg
initCmd =
    Cmd.none

initModel : CreateEvent
initModel = (
    CreateEvent
        ""
        ""
    )
