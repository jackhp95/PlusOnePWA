module Pages.CreateEvent.Model exposing (..)
import Pages.CreateEvent.Messages exposing (..)
import Pages.Event.Model exposing(Event)
import Date exposing (Date)
import Time exposing (Time)
import RemoteData exposing (..)


type alias CreateEvent =
    { title : String
    , description : String
    , location : String
    , date : String
    , time : String
    , privacy : String
    , taxonomy : String
    , eventResponse: ResponseModel
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
        ""
        ""
        ""
        ""
        ""
        RemoteData.Loading
    )
