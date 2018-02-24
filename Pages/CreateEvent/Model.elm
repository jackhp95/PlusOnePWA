module Pages.CreateEvent.Model exposing (..)
import Pages.CreateEvent.Messages exposing (..)
import Pages.Event.Model
import Date exposing (Date)
import Time exposing (Time)
import RemoteData exposing (..)

import Graphqelm.SelectionSet exposing (SelectionSet, with)
import GraphCool.Object.Event as Event
import GraphCool.Query as Query
import Graphqelm.Operation exposing (RootQuery)
import GraphCool.Object
import Graphqelm.Http exposing (..)


type alias CreateEvent = Pages.Event.Model.EventModel

init : ( CreateEvent, Cmd Msg )
init =
    ( Pages.Event.Model.initModel, initCmd )

initCmd : Cmd Msg
initCmd =
   Cmd.none
