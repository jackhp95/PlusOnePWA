module Types exposing (..)

-- Events

import Http exposing (Error)
import Date exposing (Date)
import Task exposing (perform)
import SeatGeek.Types as SG
import Mouse exposing (Position)
import Window exposing (Size)

import Pages.CreateEvent.Messages as CreateEventMsg
import Pages.CreateEvent.Model as CreateEventModel
import Pages.Profile.Model as ProfileModel
import Pages.Chat.Model as ChatModel
import Pages.Events.Model as EventsModel
import Pages.Pool.Model as PoolModel


-- MODEL --


type alias Model =
    { route : Route
    , chat : ChatModel.Chat
    , chats : List ChatModel.Chat
    , profile : ProfileModel.Profile
    , events : EventsModel.Events
    , pool : PoolModel.Pool
    , client : Client
    , createEvent : CreateEventModel.CreateEvent
    }


initModel : Model
initModel =
    Model
        -- (GoEvents Nothing)
        (GoChats Nothing)
        ChatModel.initModel
        [ ChatModel.initModel
        , ChatModel.initModel
        , ChatModel.initModel
        , ChatModel.initModel
        , ChatModel.initModel
        , ChatModel.initModel
        , ChatModel.initModel
        ]
        ProfileModel.initModel
        EventsModel.initModel
        PoolModel.initModel
        initClient
        CreateEventModel.initModel


type alias Page =
    { name : String
    , icon : String
    , route : Route
    }


type Route
    = GoChats (Maybe ChatModel.Chat)
    | GoProfile
    | GoEvents (Maybe SG.Event)
    | GoCreateEvent
    | GoPool



-- | Pool Pool.Model
-- | NotFound
-- | Events Events.Model
-- | Event Event.Modsel


type alias Client =
    { textAreaHeight : Int
    }


initClient : Client
initClient =
    { textAreaHeight = 10 }



-- MESSAGES --


type
    Msg
    -- Route
    = ChangeTo Route
    --Temp
    | CreateEventMsg CreateEventMsg.Msg
      -- Chat
    | Input String
    | NewMessage String
    | ViewChat Route
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
