module Pages.User.Model exposing (..)
import Pages.User.Messages exposing (..)

type alias User =
    { avi : List String
    , name : String
    , traits : List Trait
    }


type alias Trait =
    { name : String
    , from : String
    , datetime : String
    }

init : ( User, Cmd Msg )
init =
    ( initModel, initCmd )

initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : User
initModel =
    { avi = [ "https://images.unsplash.com/photo-1496361001419-80f0d1be777a?dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D" ]
    , name = "Hannah Hazeldine"
    , traits = initTrait
    }

initTrait : List Trait
initTrait =
    [ { name = "night owl", from = "tommy", datetime = "" }
    , { name = "flirty", from = "tommy", datetime = "" }
    , { name = "talkative", from = "tommy", datetime = "" }
    , { name = "funny", from = "tommy", datetime = "" }
    ]
