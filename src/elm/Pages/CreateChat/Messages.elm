module Pages.CreateChat.Messages exposing (..)

import Pages.Chat.Model exposing (..)


type Msg
    = MutateCreateChat
    | GotCreateResponse CreateResponseModel