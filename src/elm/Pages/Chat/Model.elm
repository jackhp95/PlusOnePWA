module Pages.Chat.Model exposing (..)

import GraphCool.Enum.DateState exposing (DateState)
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Pages.Chat.Messages exposing (..)
import Pages.Message.Model exposing (Message)
import RemoteData exposing (..)


type alias Chat =
    { canceled : Maybe String
    , dateState : DateState
    , event : String
    , id : Id
    , initiated : Chatter
    , messages : Maybe (List Message)
    , passed : Maybe String
    , proposed : Maybe String
    , recipient : Maybe Chatter
    }

type alias NewChat =
    { event : Id
    , initiated : String
    , recipient : Maybe String
    }

type alias CreateResponseModel =
    RemoteData Graphqelm.Http.Error (Maybe NewChat)

type alias Chatter =
    { id : Id
    , name : String
    }


init : ( Chat, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : Chat
initModel =
    Chat
        Nothing
        GraphCool.Enum.DateState.Active
        "Loading Event..."
        (Id "123")
        (Chatter (Id "123") "Initiator")
        Nothing
        Nothing
        Nothing
        Nothing
