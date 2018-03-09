module Pages.Message.Model exposing (..)

import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Pages.Message.Messages exposing (..)
import RemoteData exposing (..)


type alias Message =
    { chat : Id
    , createdAt : DateTime
    , from : Maybe Id
    , id : Id
    , text : String
    }
    
-- Supposed to be the model of CreateMessage
-- type alias Model =
--     {
--         message: Message
--         , sendResponse : SendResponseModel   
--     }  

type alias SendResponseModel =
    RemoteData Graphqelm.Http.Error (Maybe Message)



-- Supposed to be the model of CreateMessage
-- type alias Model =
--     {
--         message: Message
--         , sendResponse : SendResponseModel
--     }


type alias SendResponseModel =
    RemoteData Graphqelm.Http.Error (Maybe Message)



-- Supposed to be the model of CreateMessage
-- type alias Model =
--     {
--         message: Message
--         , sendResponse : SendResponseModel
--     }


init : ( Message, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : Message
initModel =
    Message
        (Id "123")
        (DateTime "10/10/10")
        Nothing
        (Id "123")
        "Hia, how are you?"
