module Types exposing (..)

-- Events

import Date exposing (Date)
import Http exposing (Error)
import Mouse exposing (Position)
import Window exposing (Size)

import Pages.CreateEvent.Messages as CreateEventMsg
import Pages.EditUser.Messages as EditUserMsg
import Pages.User.Messages as UserMsg
import Pages.Chat.Messages as ChatMsg
import Pages.Chat.Model as ChatModel
import Pages.Chats.Messages as ChatsMsg
import Pages.CreateEvent.Messages as CreateEventMsg
import Pages.CreateEvent.Model as CreateEventModel
import Pages.Events.Model as EventsModel
import Pages.Pool.Model as PoolModel
import Pages.User.Messages as UserMsg
import Pages.User.Model as UserModel
import SeatGeek.Types as SG
import Task exposing (perform)
import Window exposing (Size)
import Auth0.Auth0 as Auth0
import Auth0.Authentication as Authentication

-- MODEL --

type alias Model =
    { route : Route
    , chat : ChatModel.Chat
    , chats : List ChatModel.Chat
    , events : EventsModel.Events
    , pool : PoolModel.Pool
    , client : Client
    , createEvent : CreateEventModel.CreateEvent
    , me: UserModel.Me
    }


initModel : Maybe Auth0.LoggedInUser -> Model
initModel initialAuthUser=
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
        EventsModel.initModel
        PoolModel.initModel
        initClient
        CreateEventModel.initModel
        (UserModel.initMe initialAuthUser)
        


type alias Page =
    { name : String
    , icon : String
    , route : Route
    }


type Route
    = GoChats (Maybe ChatModel.Chat)
    | GoUser
    | GoEvents (Maybe SG.Event)
    | GoCreateEvent
    | GoPool
    | GoEditUser



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
    | EditUserMsg EditUserMsg.Msg
    | UserMsg UserMsg.Msg
    | ChatMsg ChatMsg.Msg
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
    | AuthenticationMsg Authentication.Msg
