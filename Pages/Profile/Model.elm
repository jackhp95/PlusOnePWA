module Pages.Profile.Model exposing (..)
import Pages.Profile.Messages exposing (..)

type alias Profile =
    { avi : List String
    , name : String
    , traits : List Trait
    }


type alias Trait =
    { name : String
    , from : String
    , datetime : String
    }

init : ( Profile, Cmd Msg )
init =
    ( initModel, initCmd )

initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : Profile
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
