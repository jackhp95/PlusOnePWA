module Types exposing (..)

import Auth0.Auth0 as Auth0
import Date exposing (..)
import EveryDict exposing (..)
import GraphCool.Enum.DateState as DateState exposing (DateState)
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (Error)
import Ports
import RemoteData exposing (..)
import SeatGeek.Types as SG
import Time exposing (..)


juan : Me
juan =
    { recipient = []
    , birthday = DateTime "2015-11-22T13:57:31.123Z"
    , proposed = []
    , name = "Juan"
    , updatedAt = DateTime "2018-03-13T10:38:45.000Z"
    , nameFull = Nothing
    , email = Just "1@mail.com"
    , datesCanceled = []
    , passed = []
    , attendingEvent = [ Id "cjew55h0ozyaw0129q6xfwdzk" ]
    , bio = Nothing
    , likedEvent = []
    , id = Id "cjepixltacwzz0153vxgep8pb"
    , hosts = []
    , createdEvents =
        [ Id "cjet0q9z1va3k0199pm1lhxyz"
        , Id "cjet0qbnzvdas0134zkuyyu6e"
        , Id "cjew55h0ozyav012985mevhky"
        ]
    , createdAt = DateTime "2018-03-13T10:38:45.000Z"
    , initiated =
        [ Id "cjet60pyy5q8701499ahtb1cp"
        ]
    , sent = []
    , viewedEvent =
        [ Id "cjet0q9z1va3l0199hpf433hr"
        , Id "cjet0qbo0vdat0134wd2yvj2a"
        ]
    , auth0UserId = Nothing
    , password = Just "$2a$10$M7mzvYVA9GlDsGYv7fmYYOIeSZQihRNC.HJjHfeqcvquUdY6zyFbW"
    }


type Route
    = GoChats (Maybe Id)
    | GoUser Id
    | GoEvents (Maybe Id)
    | GoCreateEvent
    | GoPool Pool
    | GoEditMe
    | GoMe Me
    | GoLogOut


initId : Id
initId =
    Id "initId"


initDateTime : DateTime
initDateTime =
    DateTime "initDateTime"


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
    , events : List Id
    , id : Id
    , name : String
    , nameFull : Maybe String
    , users : List Id
    , venues : List Id
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
    , hosts : List Id
    , id : Id
    , name : String
    , nameFull : Maybe String
    , private : Bool
    , startsAt : DateTime
    , venues : List Id
    }


type alias Pool =
    { chats : List Id
    , event : Maybe Id
    , id : Id
    , seatGeekId : Maybe String
    , usersAttending : List Id
    , usersLiked : List Id
    , usersViewed : List Id
    }


type alias Message =
    { chat : Id
    , createdAt : DateTime
    , from : Maybe Id
    , id : Id
    , text : String
    }


type alias Chat =
    { canceled : Maybe Id
    , dateState : DateState
    , pool : Id
    , id : Id
    , initiated : Id
    , messages : List Id
    , passed : Maybe Id
    , proposed : Maybe Id
    , recipient : Id
    }


type alias User =
    { bio : Maybe String
    , birthday : DateTime
    , createdAt : DateTime
    , createdEvents : List Id
    , email : Maybe String
    , attendingEvent : List Id
    , likedEvent : List Id
    , hosts : List Id
    , id : Id
    , name : String
    , nameFull : Maybe String
    , updatedAt : DateTime
    }


type alias Me =
    { auth0UserId : Maybe String
    , bio : Maybe String
    , birthday : DateTime
    , createdAt : DateTime
    , createdEvents : List Id
    , datesCanceled : List Id
    , email : Maybe String
    , attendingEvent : List Id
    , likedEvent : List Id
    , viewedEvent : List Id
    , hosts : List Id
    , id : Id
    , initiated : List Id
    , name : String
    , nameFull : Maybe String
    , passed : List Id
    , password : Maybe String
    , proposed : List Id
    , recipient : List Id
    , sent : List Id
    , updatedAt : DateTime
    }


type alias Auth =
    { state : Auth0.AuthenticationState
    , authorize : Auth0.Options -> Cmd Msg
    , logOut : () -> Cmd Msg
    , getUserId : Id
    }


type alias Forms =
    { eventForm : Event
    , meForm : Me
    }


type API
    = GraphCool Event
    | SeatGeek SG.Event


initEvent : Event
initEvent =
    Event initId initDateTime initId Nothing [] initId "initEventName" Nothing True initDateTime []


initPool : Pool
initPool =
    Pool [] Nothing initId Nothing [] [] []


initMessage : Message
initMessage =
    Message initId initDateTime Nothing initId ""


initChat : Chat
initChat =
    Chat Nothing DateState.Active initId initId initId [] Nothing Nothing initId


initUser : User
initUser =
    User Nothing initDateTime initDateTime [] Nothing [] [] [] initId "initUserName" Nothing initDateTime


initMe : Me
initMe =
    { auth0UserId = Nothing
    , bio = Nothing
    , birthday = initDateTime
    , createdAt = initDateTime
    , createdEvents = []
    , datesCanceled = []
    , email = Nothing
    , attendingEvent = []
    , likedEvent = []
    , viewedEvent = []
    , hosts = []
    , id = initId
    , initiated = []
    , name = "initMe"
    , nameFull = Nothing
    , passed = []
    , password = Nothing
    , proposed = []
    , recipient = []
    , sent = []
    , updatedAt = initDateTime
    }


initAuth : (Auth0.Options -> Cmd Msg) -> (() -> Cmd Msg) -> Maybe Auth0.LoggedInUser -> Auth
initAuth authorize logOut initialData =
    { state =
        case initialData of
            Just user ->
                Auth0.LoggedIn user

            Nothing ->
                Auth0.LoggedOut
    , authorize = authorize
    , logOut = logOut
    , getUserId = Id "0"
    }


initForms : Forms
initForms =
    Forms initEvent initMe


type alias Model =
    { route : Route
    , hosts : EveryDict Id Host
    , venues : EveryDict Id Venue
    , locations : EveryDict Id Location
    , events : EveryDict Id API
    , pools : EveryDict Id Pool
    , messages : EveryDict Id Message
    , chats : EveryDict Id Chat
    , users : EveryDict Id User
    , me : Maybe Me
    , auth : Auth
    , forms : Forms
    , errors : List String
    }


emptyModel : Maybe Auth0.LoggedInUser -> Model
emptyModel initialAuthUser =
    Model
        -- route
        (GoEvents Nothing)
        -- hosts
        EveryDict.empty
        -- venues
        EveryDict.empty
        -- locations
        EveryDict.empty
        -- events
        EveryDict.empty
        -- pools
        EveryDict.empty
        -- messages
        EveryDict.empty
        -- chats
        EveryDict.empty
        -- users
        EveryDict.empty
        -- me
        Nothing
        -- (Just juan)
        -- auth model
        (initAuth Ports.auth0authorize Ports.auth0logout initialAuthUser)
        -- forms
        initForms
        -- errors
        []


type alias Page =
    { name : String
    , icon : String
    , route : Route
    }


type
    Msg
    -- Route
    = RouteTo Route
      -- SeatGeek
    | GetReply (WebData SG.Reply)
      -- Return Everything
    | ReturnEverything (RemoteData Graphqelm.Http.Error Everything)
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
      -- Payload
    | ReturnMaybeEmpty (RemoteData Graphqelm.Http.Error (Maybe ()))
      -- Forms
    | UpdateValue InputValue
      -- Auth
    | ReturnAuth Auth0.AuthenticationResult


type
    InputValue
    -- User
    = MeName String
    | MeNameFull String
    | MeBio String
    | MeBirthday String
    | MeSubmit
      -- Message
    | MessageRefresh Id
    | MessageText Id String
    | MessageSend {- chat -} Id {- me -} Id Message
      -- Event
    | EventName String
    | EventNameFull String
    | EventStartDate String
    | EventEndDate String
    | EventSubmit



-- ---------- --
-- Primitives --
-- ---------- --


epoch : Date
epoch =
    Date.fromTime <| Time.second
