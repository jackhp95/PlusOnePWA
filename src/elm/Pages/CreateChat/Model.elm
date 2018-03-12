module Pages.CreateChat.Model exposing (..)

import GraphCool.Scalar exposing (..)
import Pages.CreateChat.Messages exposing (..)
import Pages.Chat.Model exposing (..)
import RemoteData exposing (..)


type alias CreateChat =
    { eventId : Id
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
