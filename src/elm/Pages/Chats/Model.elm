module Pages.Chats.Model exposing (..)

import Graphqelm.Http exposing (..)
import Pages.Chat.Model exposing (Chat)
import RemoteData exposing (..)

<<<<<<< HEAD
=======

>>>>>>> 435affb344c0a6bb2ba136fefce7d94fd7849169
type alias Response =
    { user : Maybe UserChats
    }


type alias UserChats =
    { initiated : Maybe (List Chat)
    , recipient : Maybe (List Chat)
    }


type alias Chats =
    RemoteData Graphqelm.Http.Error Response

<<<<<<< HEAD
=======

>>>>>>> 435affb344c0a6bb2ba136fefce7d94fd7849169
initModel : Chats
initModel =
    RemoteData.Loading
