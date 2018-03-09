module Pages.Chat.Model exposing (..)

import GraphCool.Enum.DateState exposing (DateState)
import GraphCool.Scalar exposing (..)
import Pages.Chat.Messages exposing (..)
import Pages.Message.Model exposing (Message)
<<<<<<< HEAD
=======

>>>>>>> 435affb344c0a6bb2ba136fefce7d94fd7849169

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
<<<<<<< HEAD
=======
    }


type alias Chatter =
    { id : Id
    , name : String
>>>>>>> 435affb344c0a6bb2ba136fefce7d94fd7849169
    }

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
