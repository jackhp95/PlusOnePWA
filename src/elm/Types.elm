module Types exposing (..)

-- Events
-- import Date exposing (Date)
-- import Pages.Chat.Messages as ChatMsg
-- import Pages.Chat.Model as ChatModel
-- import Pages.Chats.Messages as ChatsMsg
-- import Pages.Chats.Model as ChatsModel
-- import Pages.CreateChat.Messages as CreateChatMsg
-- -- import Pages.CreateChat.Model as CreateChatModel
-- import Pages.CreateEvent.Messages as CreateEventMsg
-- import Pages.CreateEvent.Model as CreateEventModel
-- import Pages.CreateMessage.Messages as CreateMessageMsg
-- import Pages.CreateMessage.Model as CreateMessageModel
-- import Pages.EditUser.Messages as EditUserMsg
-- import Pages.Event.Messages as EventPoolMsg
-- import Pages.Event.Model as EventModel
-- import Pages.Events.Messages as EventsMsg
-- import Pages.Events.Model as EventsModel
-- -- import Pages.Pool.Model as PoolModel
-- import Pages.User.Messages as UserMsg
-- -- import Pages.User.Model as UserModel
-- import Mouse exposing (Position)
-- import Auth0.Auth0 as Auth0

import Auth0.Authentication as Authentication
import GraphCool.Enum.DateState as DateState exposing (DateState)
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (Error)
import Http exposing (Error)
import RemoteData exposing (..)
import SeatGeek.Types as SG


type Route
    = GoChats (Maybe Id)
    | GoUser (Maybe Id)
    | GoEvents (Maybe Id)
    | GoCreateEvent
    | GoPool (Maybe Id)
    | GoEditUser Id
    | GoAuth
    | GoMe Me


initId : Id
initId =
    Id "init"


initDateTime : DateTime
initDateTime =
    DateTime "init"


type alias Everything =
    { hosts : List Host
    , venues : List Venue
    , locations : List Location
    , events : List Event
    , pools : List Pool
    , messages : List Message
    , chats : List Chat
    , users : List User
    , me : Maybe Me
    }


type alias Host =
    { createdAt : DateTime
    , description : Maybe String
    , events : Maybe (List Event)
    , id : Id
    , name : String
    , nameFull : Maybe String
    , users : Maybe (List Id)
    , venues : Maybe (List Id)
    }


type alias Venue =
    { createdAt : DateTime
    , description : Maybe String
    , id : Id
    , name : String
    , nameFull : String
    }


type alias Location =
    { address : Maybe String
    , addressFull : Maybe String
    , city : Maybe String
    , country : Maybe String
    , createdAt : DateTime
    , id : Id
    , lat : Float
    , lon : Float
    , state : String
    , venue : Maybe Id
    , zip : Maybe String
    }


type alias Event =
    { pool : Id
    , createdAt : DateTime
    , createdBy : Id
    , endsAt : Maybe DateTime
    , hosts : Maybe (List Id)
    , id : Id
    , name : String
    , nameFull : Maybe String
    , private : Bool
    , startsAt : DateTime
    , venues : Maybe (List Id)
    }


initEvent : Event
initEvent =
    Event initId initDateTime initId Nothing Nothing initId "initName" Nothing True initDateTime Nothing


type alias Pool =
    { chats : Maybe (List Id)
    , event : Maybe Id
    , id : Id
    , seatGeekId : Maybe String
    , usersAttending : Maybe (List Id)
    , usersLiked : Maybe (List Id)
    , usersViewed : Maybe (List Id)
    }


initPool : Pool
initPool =
    Pool Nothing Nothing initId Nothing Nothing Nothing Nothing


type alias Message =
    { chat : Id
    , createdAt : DateTime
    , from : Maybe Id
    , id : Id
    , text : String
    }


initMessage : Message
initMessage =
    Message initId initDateTime Nothing initId "initText"


type alias Chat =
    { canceled : Maybe Id
    , dateState : DateState
    , pool : Id
    , id : Id
    , initiated : Id
    , messages : Maybe (List Message)
    , passed : Maybe Id
    , proposed : Maybe Id
    , recipient : Maybe Id
    }


initChat : Chat
initChat =
    Chat Nothing DateState.Active initId initId initId Nothing Nothing Nothing Nothing


type alias User =
    { bio : Maybe String
    , birthday : DateTime
    , createdAt : DateTime
    , createdEvents : Maybe (List Id)
    , email : Maybe String
    , attendingEvent : Maybe (List Id)
    , likedEvent : Maybe (List Id)
    , hosts : Maybe (List Id)
    , id : Id
    , name : String
    , nameFull : Maybe String
    , updatedAt : DateTime
    }


initUser : User
initUser =
    User Nothing initDateTime initDateTime Nothing Nothing Nothing Nothing Nothing initId "initName" Nothing initDateTime


type alias Me =
    { auth0UserId : Maybe String
    , bio : Maybe String
    , birthday : DateTime
    , createdAt : DateTime
    , createdEvents : Maybe (List Id)
    , datesCanceled : Maybe (List Id)
    , email : Maybe String
    , attendingEvent : Maybe (List Id)
    , likedEvent : Maybe (List Id)
    , viewedEvent : Maybe (List Id)
    , hosts : Maybe (List Id)
    , id : Id
    , initiated : Maybe (List Id)
    , name : String
    , nameFull : Maybe String
    , passed : Maybe (List Id)
    , password : Maybe String
    , proposed : Maybe (List Id)
    , recipient : Maybe (List Id)
    , sent : Maybe (List Id)
    , updatedAt : DateTime
    }


initMe : Me
initMe =
    Me Nothing Nothing initDateTime initDateTime Nothing Nothing Nothing Nothing Nothing Nothing Nothing initId Nothing "initName" Nothing Nothing Nothing Nothing Nothing Nothing initDateTime



-- MODEL --
-- OLD MODEL DO NOT USE
-- type alias Model =
--     { route : Route
--     , chat : Types.Chat
--     , chats : ChatsModel.Chats
--     , events : List EventsModel.EventAPI
--     , pool : PoolModel.PoolModel
--     , client : Client
--     , createEvent : CreateEventModel.CreateEvent
--     , createMessage : CreateMessageModel.CreateMessage
--     , createChat : CreateChatModel.CreateChat
--     , me : UserModel.Me
--     , errors : List String
--     }


type alias Model =
    { route : Route
    , hosts : List Host
    , venues : List Venue
    , locations : List Location
    , events : List Event
    , pools : List Pool
    , messages : List Message
    , chats : List Chat
    , users : List User
    , me : Maybe Me
    , errors : List String
    }


emptyModel : Model
emptyModel =
    Model
        -- route
        (GoEvents Nothing)
        -- hosts
        []
        -- venues
        []
        -- locations
        []
        -- events
        []
        -- pools
        []
        -- messages
        []
        -- chats
        []
        -- users
        []
        -- me
        Nothing
        -- errors
        []



-- initModel : Maybe Auth0.LoggedInUser -> Model
-- initModel initialAuthUser =
--     Model
--         (GoEvents Nothing)
--         -- (GoChats Nothing)
--         ChatModel.initModel
--         ChatsModel.initModel
--         []
--         PoolModel.initModel
--         initClient
--         EventModel.initModel
--         CreateMessageModel.initModel
--         CreateChatModel.initModel
--         (UserModel.initMe initialAuthUser)
--         []


type alias Page =
    { name : String
    , icon : String
    , route : Route
    }



-- type Route
--     = GoChats (Maybe Types.Chat)
--     | GoUser
--     | GoEvents (Maybe EventsModel.EventAPI)
--     | GoCreateEvent
--     | GoPool
--     | GoEditUser
--     | GoAuth
-- | Pool Pool.Model
-- | NotFound
-- | Events Events.Model
-- | Event Event.Modsel
-- type alias Client =
--     { textAreaHeight : Int
--     }
-- initClient : Client
-- initClient =
--     { textAreaHeight = 10 }
-- MESSAGES --


type
    Msg
    -- Route
    = RouteTo Route
      -- | AuthenticationMsg Authentication.Msg
      -- | TextAreaResizer Int
      -- SeatGeek
      -- | GetReply (Result Http.Error SG.Reply)
      -- From TestGraphCool
      -- Query Many
    | ReturnHosts (RemoteData Graphqelm.Http.Error (List Host))
    | ReturnVenues (RemoteData Graphqelm.Http.Error (List Venue))
    | ReturnLocations (RemoteData Graphqelm.Http.Error (List Location))
    | ReturnEvents (RemoteData Graphqelm.Http.Error (List Event))
    | ReturnPools (RemoteData Graphqelm.Http.Error (List Pool))
    | ReturnMessages (RemoteData Graphqelm.Http.Error (List Message))
    | ReturnChats (RemoteData Graphqelm.Http.Error (List Chat))
    | ReturnUsers (RemoteData Graphqelm.Http.Error (List User))
      -- Query One
    | ReturnMe (RemoteData Graphqelm.Http.Error Me)
    | ReturnHost (RemoteData Graphqelm.Http.Error Host)
    | ReturnVenue (RemoteData Graphqelm.Http.Error Venue)
    | ReturnLocation (RemoteData Graphqelm.Http.Error Location)
    | ReturnEvent (RemoteData Graphqelm.Http.Error Event)
    | ReturnPool (RemoteData Graphqelm.Http.Error Pool)
    | ReturnMessage (RemoteData Graphqelm.Http.Error Message)
    | ReturnChat (RemoteData Graphqelm.Http.Error Chat)
    | ReturnUser (RemoteData Graphqelm.Http.Error User)
      -- Mutate
    | ReturnMaybeMe (RemoteData Graphqelm.Http.Error (Maybe Me))
    | ReturnMaybeHost (RemoteData Graphqelm.Http.Error (Maybe Host))
    | ReturnMaybeVenue (RemoteData Graphqelm.Http.Error (Maybe Venue))
    | ReturnMaybeLocation (RemoteData Graphqelm.Http.Error (Maybe Location))
    | ReturnMaybeEvent (RemoteData Graphqelm.Http.Error (Maybe Event))
    | ReturnMaybePool (RemoteData Graphqelm.Http.Error (Maybe Pool))
    | ReturnMaybeMessage (RemoteData Graphqelm.Http.Error (Maybe Message))
    | ReturnMaybeChat (RemoteData Graphqelm.Http.Error (Maybe Chat))
    | ReturnMaybeUser (RemoteData Graphqelm.Http.Error (Maybe User))
      -- Forms
    | UpdateValue InputValue


type
    InputValue
    -- User
    = UserName String
    | UserFullName String
    | UserBio String
    | UserBirthday String
    | UserSubmit
      -- Event
    | EventName String
    | EventNameFull String
    | EventStartDate String
    | EventEndDate String
    | EventSubmit



-- Pool
-- | MouseStart Position
-- | MouseMove Position
-- | MouseEnd Position
-- | ResizePool Size
-- | InitialWindow Size
--   --Temp
-- | CreateEventMsg CreateEventMsg.Msg
-- | EventsMsg EventsMsg.Msg
-- | EditUserMsg EditUserMsg.Msg
-- | UserMsg UserMsg.Msg
-- | UpdateTextInput String
-- | CreateMessageMsg CreateMessageMsg.Msg
-- | CreateChatMsg CreateChatMsg.Msg
-- | ChatMsg ChatMsg.Msg
-- | ChatsMsg ChatsMsg.Msg
--   -- Chat
-- | Input String
-- | NewMessage String
-- | ViewChat Route
--   -- Events
-- | ViewEvent Route
-- | ViewPool Route
-- | UpdateChats Route CreateChatModel.CreateChat
-- | EventPoolMsg EventPoolMsg.Msg
