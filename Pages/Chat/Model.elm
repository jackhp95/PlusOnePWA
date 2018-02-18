module Pages.Chat.Model exposing (..)
import Pages.Chat.Messages exposing (..)

type alias Chat =
    { uid : String
    , input : String
    , messages : List String
    , userAvi : String
    }

init : ( Chat, Cmd Msg )
init =
    ( initModel, initCmd )

initCmd : Cmd Msg
initCmd =
    Cmd.none

initModel : Chat
initModel =
    { uid = "string"
    , input = ""
    , messages =
        [ "hello, this is a really long message to test text-overflow: elipse. Does it work? Does it look okay?"
        , "what's up?"
        , "not much"
        ]
    , userAvi =
        "https://images.unsplash.com/photo-1496361001419-80f0d1be777a?dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"
    }
