module Pages.CreateMessage.Model exposing (..)

import GraphCool.Scalar exposing (..)
import Pages.CreateMessage.Messages exposing (..)
import Pages.Message.Model exposing (..)
import RemoteData exposing (..)


type alias CreateMessage =
    { chatId : Id
    , text : String
    , sendResponse : SendResponseModel
    }


init : ( CreateMessage, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : CreateMessage
initModel =
    CreateMessage
        (Id "")
        ""
        RemoteData.Loading
