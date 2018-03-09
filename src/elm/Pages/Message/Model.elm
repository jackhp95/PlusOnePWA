module Pages.Message.Model exposing (..)

import Pages.Message.Messages exposing (..)


type alias Message =
    { chat : String
    , createdAt : String
    , from : String
    , id : Int
    , text : String
    }


init : ( Message, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : Message
initModel =
    Message
        "Some chat"
        "10/10/10"
        "Alex"
        1
        "Hia, how are you?"
