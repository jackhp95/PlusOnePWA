module Pages.Chats.Messages exposing (..)

import Pages.Chats.Model exposing (Chats)

type Msg
    = MakeQueryRequest
    | GotQueryResponse Chats
