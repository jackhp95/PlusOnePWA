module Pages.CreateChat.Model exposing (..)

import GraphCool.Scalar exposing (..)
import Pages.Chat.Model exposing (..)
import Pages.CreateChat.Messages exposing (..)
import RemoteData exposing (..)


type alias CreateChat =
    { poolId : Id
    , initiatedId : Id
    , recipientId : Id
    , createResponse : CreateResponseModel
    }


init : ( CreateChat, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : CreateChat
initModel =
    CreateChat
        (Id "")
        (Id "")
        (Id "")
        RemoteData.Loading
