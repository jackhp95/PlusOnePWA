module Types exposing (..)

-- Events

import Http exposing (Error)
import Date exposing (..)
import Task exposing (perform)
import SeatGeekTypes as SG


-- MODEL --


type alias Model =
    { route : Route
    , chat : Chat
    , profile : Profile
    , events : Events
    }


initModel : Model
initModel =
    Model
        GoChat
        initChat
        initProfile
        initEvents


type alias Page =
    { name : String
    , icon : String
    , route : Route
    }


type Route
    = GoChat
    | GoProfile
    | GoEvent
    | GoEvents



-- | Pool Pool.Model
-- | NotFound
-- | Events Events.Model
-- | Event Event.Modsel


type alias Chat =
    { input : String
    , messages : List String
    , userAvi : String
    }


initChat : Chat
initChat =
    { input = ""
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
    , selectedEvent : Maybe Int
    , currentDatetime : Maybe Date
    }


initEvents : Events
initEvents =
    { seatgeek = SG.emptyReply
    , selectedEvent = Nothing
    , currentDatetime = Nothing
    }



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
    | ViewEvent (Maybe Int)
    | OnDatetime Date
      -- SeatGeek
    -- | Discover
    | GetReply (Result Http.Error SG.Reply)
