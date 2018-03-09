module Pages.CreateMessage.Messages exposing (..)

import Pages.Message.Model exposing (..)


-- import GraphCool.Scalar exposing(..)


type Msg
    = SendMessage
    | GotSendResponse SendResponseModel
    | ChangeText String
