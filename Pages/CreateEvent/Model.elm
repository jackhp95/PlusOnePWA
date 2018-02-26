module Pages.CreateEvent.Model exposing (..)

import Date exposing (Date)
import Pages.CreateEvent.Messages exposing (..)
import Time exposing (Time)


type alias CreateEvent =
    { title : String
    , description : String
    , location : String
    , date : String
    , time : String
    , privacy : String
    , taxonomy : String
    }


init : ( CreateEvent, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : CreateEvent
initModel =
    CreateEvent
        ""
        ""
        ""
        ""
        ""
        ""
        ""
