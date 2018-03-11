module Types exposing (..)

-- Events
-- import GraphCool.Scalar exposing (..)
-- import Date exposing (Date)

import Auth0.Auth0 as Auth0
import Auth0.Authentication as Authentication
import Http exposing (Error)
import Mouse exposing (Position)
import Pages.Chat.Messages as ChatMsg
import Pages.Chat.Model as ChatModel
import Pages.Chats.Messages as ChatsMsg
import Pages.Chats.Model as ChatsModel
import Pages.CreateEvent.Messages as CreateEventMsg
import Pages.CreateEvent.Model as CreateEventModel
import Pages.CreateMessage.Messages as CreateMessageMsg
import Pages.CreateMessage.Model as CreateMessageModel
import Pages.EditUser.Messages as EditUserMsg
import Pages.Event.Model as EventModel
import Pages.Events.Messages as EventsMsg
import Pages.Events.Model as EventsModel
import Pages.Pool.Model as PoolModel
import Pages.User.Messages as UserMsg
import Pages.User.Model as UserModel
import SeatGeek.Types as SG
import Window exposing (Size)


-- MODEL --


type alias Model =
    { route : Route
    , chat : ChatModel.Chat
    , chats : ChatsModel.Chats
    , events : List EventsModel.EventAPI
    , pool : PoolModel.Pool
    , client : Client
    , createEvent : CreateEventModel.CreateEvent
    , createMessage : CreateMessageModel.CreateMessage
    , me : UserModel.Me
    , errors : List String
    }


initModel : Maybe Auth0.LoggedInUser -> Model
initModel initialAuthUser =
    Model
        (GoEvents Nothing)
        -- (GoChats Nothing)
        ChatModel.initModel
        ChatsModel.initModel
        []
        PoolModel.initModel
        initClient
        EventModel.initModel
        CreateMessageModel.initModel
        (UserModel.initMe initialAuthUser)
        []


type alias Page =
    { name : String
    , icon : String
    , route : Route
    }


type Route
    = GoChats (Maybe ChatModel.Chat)
    | GoUser
    | GoEvents (Maybe EventsModel.EventAPI)
    | GoCreateEvent
    | GoPool
    | GoEditUser
    | GoAuth



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
    | EventsMsg EventsMsg.Msg
    | EditUserMsg EditUserMsg.Msg
    | UserMsg UserMsg.Msg
    | UpdateTextInput String
    | CreateMessageMsg CreateMessageMsg.Msg
    | ChatMsg ChatMsg.Msg
    | ChatsMsg ChatsMsg.Msg
      -- Chat
    | Input String
    | NewMessage String
    | ViewChat Route
      -- Events
    | ViewEvent Route
      -- | OnDatetime Date
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
