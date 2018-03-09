module Pages.Pool.Model exposing (..)

import Mouse exposing (Position)
import Pages.Pool.Messages exposing (..)
import Window exposing (Size)


-- POOL --


type alias Pool =
    { position : Position
    , move : Maybe Move
    , tube : Tube
    , windowSize : Size
    , tubers : List Tuber
    , users : List User
    }


init : ( Pool, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : Pool
initModel =
    { position = initPosition
    , move = Nothing
    , tube = initTube
    , windowSize = initWindow
    , tubers = loremTubers
    , users = loremUsers
    }



-- Position Was Imported


initPosition : Position
initPosition =
    { x = 0
    , y = 0
    }


type alias Move =
    { start : Position
    , current : Position
    }


initMove : Maybe Move
initMove =
    Nothing


type alias Tube =
    { diameter : Int
    , ring : Ring
    , spacing : Int
    , pop : Int
    }


initTube : Tube
initTube =
    { diameter = 100
    , ring = initRing
    , spacing = 300
    , pop = 110
    }


type alias Ring =
    { width : Int
    , padding : Int
    }


initRing : Ring
initRing =
    { width = 2
    , padding = 3
    }



-- Window.Size was imported


initWindow : Size
initWindow =
    Size 1440 1440


type alias Tuber =
    { uniqueID : Int
    , offset : Position
    }


loremTubers : List Tuber
loremTubers =
    [ Tuber 1 (Position 0 0)
    , Tuber 2 (Position 300 300)
    , Tuber 3 (Position 600 600)
    ]


type alias User =
    { uniqueID : Int
    , name : String
    , pic : String
    , online : Bool
    , chattor : Bool
    , chattee : Bool
    }


loremUsers : List User
loremUsers =
    [ User 1 "doug" "https://randomuser.me/api/portraits/men/1.jpg" True True True
    , User 2 "lillith" "https://randomuser.me/api/portraits/men/2.jpg" True True True
    , User 3 "kyle" "https://randomuser.me/api/portraits/men/3.jpg" True True True
    , User 4 "borf" "https://randomuser.me/api/portraits/men/4.jpg" True True True
    ]
