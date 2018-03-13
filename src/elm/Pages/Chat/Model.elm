module Pages.Chat.Model exposing (..)

import GraphCool.Enum.DateState exposing (DateState)
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Pages.Chat.Messages exposing (..)
import Pages.Message.Model exposing (Message)
import RemoteData exposing (..)


type alias Chat =
    { canceled : Maybe Id
    , dateState : DateState
    , pool : Id
    , id : Id
    , initiated : Id
    , messages : Maybe (List Message)
    , passed : Maybe Id
    , proposed : Maybe Id
    , recipient : Maybe Id
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
        (Id "123")
        (Id "123")
        (Id "123")
        Nothing
        Nothing
        Nothing
        Nothing
