module Types exposing (..)

-- Events

import Http exposing (Error)
import Date exposing (Date)
import Task exposing (perform)
import SeatGeek.Types as SG
import Mouse exposing (Position)
import Window exposing (Size)


-- MODEL --


type alias Model =
    { route : Route
    , chat : Chat
    , profile : Profile
    , events : Events
    , pool : Pool
    , client : Client
    }


initModel : Model
initModel =
    Model
        (GoEvents Nothing)
        initChat
        initProfile
        initEvents
        initPool
        initClient


type alias Page =
    { name : String
    , icon : String
    , route : Route
    }


type Route
    = GoChat
    | GoProfile
    | GoEvents (Maybe SG.Event)
    | GoPool



-- | Pool Pool.Model
-- | NotFound
-- | Events Events.Model
-- | Event Event.Modsel


type alias Chat =
    { uid : String
    , input : String
    , messages : List String
    , userAvi : String
    }


initChat : Chat
initChat =
    { uid = "string"
    , input = ""
    , messages = []
    , userAvi =
        "https://images.unsplash.com/photo-1496361001419-80f0d1be777a?dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"
    }


type alias Profile =
    { avi : List String
    , name : String
    , traits : List Trait
    }


initProfile : Profile
initProfile =
    { avi = [ "https://images.unsplash.com/photo-1496361001419-80f0d1be777a?dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D" ]
    , name = "Hannah Hazeldine"
    , traits = initTrait
    }


type alias Trait =
    { name : String
    , from : String
    , datetime : String
    }


initTrait : List Trait
initTrait =
    [ { name = "night owl", from = "tommy", datetime = "" }
    , { name = "flirty", from = "tommy", datetime = "" }
    , { name = "talkative", from = "tommy", datetime = "" }
    , { name = "funny", from = "tommy", datetime = "" }
    ]


type alias Events =
    { seatgeek : SG.Reply
    , currentDatetime : Maybe Date
    }


initEvents : Events
initEvents =
    { seatgeek = SG.emptyReply
    , currentDatetime = Nothing
    }


type alias Client =
    { textAreaHeight : Int
    }


initClient : Client
initClient =
    { textAreaHeight = 10 }



-- POOL --


type alias Pool =
    { position : Position
    , move : Maybe Move
    , tube : Tube
    , windowSize : Size
    , tubers : List Tuber
    , users : List User
    }


initPool : Pool
initPool =
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



-- MESSAGES --


type
    Msg
    -- Route
    = ChangeTo Route
      -- Chat
    | Input String
    | SendChatMessage
    | NewMessage String
      -- Events
    | ViewEvent Route
    | OnDatetime Date
      -- SeatGeek
    | GetReply (Result Http.Error SG.Reply)
    | TextAreaResizer Int
      -- Pool
    | MouseStart Position
    | MouseMove Position
    | MouseEnd Position
    | ResizePool Size
    | InitialWindow Size
