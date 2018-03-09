module Pages.Chats.Model exposing (..)

import Graphqelm.Http exposing (..)
import Pages.Chat.Model exposing (Chat)
import RemoteData exposing (..)

type alias Response =
    { user : Maybe UserChats
    }


type alias UserChats =
    { initiated : Maybe (List Chat)
    , recipient : Maybe (List Chat)
    }


type alias Chats =
    RemoteData Graphqelm.Http.Error Response

initModel : Chats
initModel =
    RemoteData.Loading
