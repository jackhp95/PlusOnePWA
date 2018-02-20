module Pages.Chat.Model exposing (..)
import Pages.Chat.Messages exposing (..)

type alias Chat =
    { canceled : String
    , dateState : String
    , event : String
    , id : Int
    , initiated : String
    , messages : List String
    , passed : String
    , proposed : String
    , recipient : String
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
    Chat
        "10/10/10"
        "Active"
        "Event 1"
        1
        "Alex"
        ["Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?",
        "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?",
        "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?",
        "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"]
        "Nope"
        "Nope"
        "Nope"
        "https://images.unsplash.com/photo-1496361001419-80f0d1be777a?dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"
