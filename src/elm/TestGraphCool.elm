module TestGraphCool exposing (main)

-- import Graphqelm.Field as Field
-- import Types exposing (..)

import Dict exposing (..)
import DictFrom exposing (..)
import GraphCool.Enum.DateState as DateState exposing (DateState)
import GraphCool.InputObject as IO
import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.Location as Location
import GraphCool.Object.Message as Message
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as User
import GraphCool.Object.Venue as Venue
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Field exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import Html.Attributes exposing (..)
import RemoteData exposing (..)


type alias Model =
    { hosts : Dict String Host
    , venues : Dict String Venue
    , locations : Dict String Location
    , events : Dict String Event
    , pools : Dict String Pool
    , messages : Dict String Message
    , chats : Dict String Chat
    , users : Dict String User
    , me : Maybe Me
    , errors : List String
    }


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


queryEverything : SelectionSet Everything RootQuery
queryEverything =
    let
        -- allMessagesFilter =
        --     \optionals -> { optionals | filter = Present <| IO.MessageFilter { initMessageFilter | chat = Present <| IO.MessageFilter chatsWithMe } }
        -- allUsersFilter =
        --     \optionals -> { optionals | filter = Present <| IO.UserFilter <| userOr [ recipientSomeFilter, initiatedSomeFilter ] }
        chatsWithMe =
            \optionals ->
                { optionals
                    | filter = Null

                    {- Present <| IO.ChatFilter <| chatOr [ recipientFilter, initiatedFilter ] -}
                }

        -- userOr argsToOr =
        --     { initUserFilter | or = Present argsToOr }
        chatOr argsToOr =
            \optionals -> { optionals | or = Present argsToOr }

        -- recipientSomeFilter =
        --     IO.UserFilter { initUserFilter | recipient_some = Present <| IO.UserFilter meIdFilter }
        -- initiatedSomeFilter =
        --     IO.UserFilter { initUserFilter | initiated_some = Present <| IO.UserFilter meIdFilter }
        -- recipientFilter =
        --     IO.ChatFilter <| \optionals -> { optionals | recipient = Present <| meIdFilter }
        -- initiatedFilter =
        --     IO.ChatFilter <| \optionals -> { optionals | initiated = Present <| meIdFilter }
        -- meIdFilter =
        --     IO.UserFilter <| \optionals -> { optionals | id = Present <| Id "cjepiz67rcnea01955enpxpdz" }
    in
    Query.selection Everything
        |> with (Query.allHosts identity host)
        |> with (Query.allVenues identity venue)
        |> with (Query.allLocations identity location)
        |> with (Query.allEvents identity event)
        |> with (Query.allPools identity pool)
        |> with (Query.allMessages identity message)
        |> with (Query.allChats chatsWithMe chat)
        |> with (Query.allUsers identity user)
        |> with (Query.me me)


updateUserMutation : SelectionSet (Maybe User) Graphqelm.Operation.RootMutation
updateUserMutation =
    Mutation.selection identity
        |> with (Mutation.updateUser identity (Mutation.UpdateUserRequiredArguments (Id "id")) user)


createUserMutation : SelectionSet (Maybe User) Graphqelm.Operation.RootMutation
createUserMutation =
    Mutation.selection identity
        |> with (Mutation.createUser identity { birthday = DateTime "1969-06-09", name = "elm", authProvider = { auth0 = Present { idToken = "id" }, email = Null } } user)


hostId : SelectionSet Id GraphCool.Object.Host
hostId =
    Host.selection identity |> with Host.id


host : SelectionSet Host GraphCool.Object.Host
host =
    Host.selection Host
        |> with Host.createdAt
        |> with Host.description
        |> with (Host.events identity eventId |> nonNullOrFail)
        |> with Host.id
        |> with Host.name
        |> with Host.nameFull
        |> with (Host.users identity userId |> nonNullOrFail)
        |> with (Host.venues identity venueId |> nonNullOrFail)


venueId : SelectionSet Id GraphCool.Object.Venue
venueId =
    Venue.selection identity |> with Venue.id


venue : SelectionSet Venue GraphCool.Object.Venue
venue =
    Venue.selection Venue
        |> with Venue.createdAt
        |> with Venue.description
        |> with Venue.id
        |> with Venue.name
        |> with Venue.nameFull


locationId : SelectionSet Id GraphCool.Object.Location
locationId =
    Location.selection identity |> with Location.id


location : SelectionSet Location GraphCool.Object.Location
location =
    Location.selection Location
        |> with Location.address
        |> with Location.addressFull
        |> with Location.city
        |> with Location.country
        |> with Location.createdAt
        |> with Location.id
        |> with Location.lat
        |> with Location.lon
        |> with Location.state
        |> with (Location.venue identity venueId)
        |> with Location.zip


eventId : SelectionSet Id GraphCool.Object.Event
eventId =
    Event.selection identity |> with Event.id


event : SelectionSet Event GraphCool.Object.Event
event =
    Event.selection Event
        |> with (Event.pool identity poolId)
        |> with Event.createdAt
        |> with (Event.createdBy identity userId)
        |> with Event.endsAt
        |> with (Event.hosts identity hostId |> nonNullOrFail)
        |> with Event.id
        |> with Event.name
        |> with Event.nameFull
        |> with Event.private
        |> with Event.startsAt
        |> with (Event.venues identity venueId |> nonNullOrFail)


poolId : SelectionSet Id GraphCool.Object.Pool
poolId =
    Pool.selection identity |> with Pool.id


pool : SelectionSet Pool GraphCool.Object.Pool
pool =
    Pool.selection Pool
        |> with (Pool.chats identity chatId |> nonNullOrFail)
        |> with (Pool.event identity eventId)
        |> with Pool.id
        |> with Pool.seatGeekId
        |> with (Pool.attending identity userId |> nonNullOrFail)
        |> with (Pool.liked identity userId |> nonNullOrFail)
        |> with (Pool.viewed identity userId |> nonNullOrFail)


messageId : SelectionSet Id GraphCool.Object.Message
messageId =
    Message.selection identity
        |> with Message.id


message : SelectionSet Message GraphCool.Object.Message
message =
    Message.selection Message
        |> with (Message.chat identity chatId)
        |> with Message.createdAt
        |> with (Message.from identity userId)
        |> with Message.id
        |> with Message.text


chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
    Chat.selection identity |> with Chat.id


chat : SelectionSet Chat GraphCool.Object.Chat
chat =
    Chat.selection Chat
        |> with (Chat.canceled identity userId)
        |> with Chat.dateState
        |> with (Chat.pool identity poolId)
        |> with Chat.id
        |> with (Chat.initiated identity userId)
        |> with (Chat.messages identity messageId |> nonNullOrFail)
        |> with (Chat.passed identity userId)
        |> with (Chat.proposed identity userId)
        |> with (Chat.recipient identity userId)


userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id


user : SelectionSet User GraphCool.Object.User
user =
    User.selection User
        |> with User.bio
        |> with User.birthday
        |> with User.createdAt
        |> with (User.createdEvents identity eventId |> nonNullOrFail)
        |> with User.email
        |> with (User.attendingEvent identity poolId |> nonNullOrFail)
        |> with (User.likedEvent identity poolId |> nonNullOrFail)
        |> with (User.hosts identity hostId |> nonNullOrFail)
        |> with User.id
        |> with User.name
        |> with User.nameFull
        |> with User.updatedAt


meId : SelectionSet Id GraphCool.Object.User
meId =
    User.selection identity |> with User.id


me : SelectionSet Me GraphCool.Object.User
me =
    User.selection Me
        |> with User.auth0UserId
        |> with User.bio
        |> with User.birthday
        |> with User.createdAt
        |> with (User.createdEvents identity eventId |> nonNullOrFail)
        |> with (User.datesCanceled identity chatId |> nonNullOrFail)
        |> with User.email
        |> with (User.attendingEvent identity poolId |> nonNullOrFail)
        |> with (User.likedEvent identity poolId |> nonNullOrFail)
        |> with (User.viewedEvent identity poolId |> nonNullOrFail)
        |> with (User.hosts identity hostId |> nonNullOrFail)
        |> with User.id
        |> with (User.initiated identity chatId |> nonNullOrFail)
        |> with User.name
        |> with User.nameFull
        |> with (User.passed identity chatId |> nonNullOrFail)
        |> with User.password
        |> with (User.proposed identity chatId |> nonNullOrFail)
        |> with (User.recipient identity chatId |> nonNullOrFail)
        |> with (User.sent identity messageId |> nonNullOrFail)
        |> with User.updatedAt


queryHosts : (Query.AllHostsOptionalArguments -> Query.AllHostsOptionalArguments) -> SelectionSet (List Host) RootQuery
queryHosts optArgs =
    Query.selection identity
        |> with (Query.allHosts optArgs host)


queryVenues : (Query.AllVenuesOptionalArguments -> Query.AllVenuesOptionalArguments) -> SelectionSet (List Venue) RootQuery
queryVenues optArgs =
    Query.selection identity
        |> with (Query.allVenues optArgs venue)


queryLocations : (Query.AllLocationsOptionalArguments -> Query.AllLocationsOptionalArguments) -> SelectionSet (List Location) RootQuery
queryLocations optArgs =
    Query.selection identity
        |> with (Query.allLocations optArgs location)


queryEvents : (Query.AllEventsOptionalArguments -> Query.AllEventsOptionalArguments) -> SelectionSet (List Event) RootQuery
queryEvents optArgs =
    Query.selection identity
        |> with (Query.allEvents optArgs event)


queryPools : (Query.AllPoolsOptionalArguments -> Query.AllPoolsOptionalArguments) -> SelectionSet (List Pool) RootQuery
queryPools optArgs =
    Query.selection identity
        |> with (Query.allPools optArgs pool)


queryMessages : (Query.AllMessagesOptionalArguments -> Query.AllMessagesOptionalArguments) -> SelectionSet (List Message) RootQuery
queryMessages optArgs =
    Query.selection identity
        |> with (Query.allMessages optArgs message)


queryChats : (Query.AllChatsOptionalArguments -> Query.AllChatsOptionalArguments) -> SelectionSet (List Chat) RootQuery
queryChats optArgs =
    Query.selection identity
        |> with (Query.allChats optArgs chat)


queryUsers : (Query.AllUsersOptionalArguments -> Query.AllUsersOptionalArguments) -> SelectionSet (List User) RootQuery
queryUsers optArgs =
    Query.selection identity
        |> with (Query.allUsers optArgs user)


queryMe : SelectionSet (Maybe Me) RootQuery
queryMe =
    Query.selection identity
        |> with (Query.me me)


requestHosts : (Query.AllHostsOptionalArguments -> Query.AllHostsOptionalArguments) -> Cmd Msg
requestHosts optArgs =
    queryHosts optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnHosts)


requestVenues : (Query.AllVenuesOptionalArguments -> Query.AllVenuesOptionalArguments) -> Cmd Msg
requestVenues optArgs =
    queryVenues optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnVenues)


requestLocations : (Query.AllLocationsOptionalArguments -> Query.AllLocationsOptionalArguments) -> Cmd Msg
requestLocations optArgs =
    queryLocations optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnLocations)


requestEvents : (Query.AllEventsOptionalArguments -> Query.AllEventsOptionalArguments) -> Cmd Msg
requestEvents optArgs =
    queryEvents optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnEvents)


requestPools : (Query.AllPoolsOptionalArguments -> Query.AllPoolsOptionalArguments) -> Cmd Msg
requestPools optArgs =
    queryPools optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnPools)


requestMessages : (Query.AllMessagesOptionalArguments -> Query.AllMessagesOptionalArguments) -> Cmd Msg
requestMessages optArgs =
    queryMessages optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnMessages)


requestChats : (Query.AllChatsOptionalArguments -> Query.AllChatsOptionalArguments) -> Cmd Msg
requestChats optArgs =
    queryChats optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnChats)


requestUsers : (Query.AllUsersOptionalArguments -> Query.AllUsersOptionalArguments) -> Cmd Msg
requestUsers optArgs =
    queryUsers optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnUsers)


requestEverything : Cmd Msg
requestEverything =
    queryEverything
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnEverything)



-- makeMutationRequest : Cmd Msg
-- makeMutationRequest =
--     updateUserMutation
--         |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
--         |> Graphqelm.Http.send (RemoteData.fromResult >> MutateUser)


init : ( Model, Cmd Msg )
init =
    ( Model Dict.empty Dict.empty Dict.empty Dict.empty Dict.empty Dict.empty Dict.empty Dict.empty Nothing []
    , requestEverything
      -- change this to MakeMutationRequest if you want to test a mutation.
    )


type Msg
    = ReturnEverything (RemoteData Graphqelm.Http.Error Everything)
    | ReturnHosts (RemoteData Graphqelm.Http.Error (List Host))
    | ReturnVenues (RemoteData Graphqelm.Http.Error (List Venue))
    | ReturnLocations (RemoteData Graphqelm.Http.Error (List Location))
    | ReturnEvents (RemoteData Graphqelm.Http.Error (List Event))
    | ReturnPools (RemoteData Graphqelm.Http.Error (List Pool))
    | ReturnMessages (RemoteData Graphqelm.Http.Error (List Message))
    | ReturnChats (RemoteData Graphqelm.Http.Error (List Chat))
    | ReturnUsers (RemoteData Graphqelm.Http.Error (List User))
    | ReturnMe (RemoteData Graphqelm.Http.Error Me)
    | ReturnHost (RemoteData Graphqelm.Http.Error Host)
    | ReturnVenue (RemoteData Graphqelm.Http.Error Venue)
    | ReturnLocation (RemoteData Graphqelm.Http.Error Location)
    | ReturnEvent (RemoteData Graphqelm.Http.Error Event)
    | ReturnPool (RemoteData Graphqelm.Http.Error Pool)
    | ReturnMessage (RemoteData Graphqelm.Http.Error Message)
    | ReturnChat (RemoteData Graphqelm.Http.Error Chat)
    | ReturnUser (RemoteData Graphqelm.Http.Error User)
    | ReturnMaybeMe (RemoteData Graphqelm.Http.Error (Maybe Me))
    | ReturnMaybeHost (RemoteData Graphqelm.Http.Error (Maybe Host))
    | ReturnMaybeVenue (RemoteData Graphqelm.Http.Error (Maybe Venue))
    | ReturnMaybeLocation (RemoteData Graphqelm.Http.Error (Maybe Location))
    | ReturnMaybeEvent (RemoteData Graphqelm.Http.Error (Maybe Event))
    | ReturnMaybePool (RemoteData Graphqelm.Http.Error (Maybe Pool))
    | ReturnMaybeMessage (RemoteData Graphqelm.Http.Error (Maybe Message))
    | ReturnMaybeChat (RemoteData Graphqelm.Http.Error (Maybe Chat))
    | ReturnMaybeUser (RemoteData Graphqelm.Http.Error (Maybe User))



-- | MutateUser (WebData (Maybe User))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReturnEverything response ->
            case response of
                Success x ->
                    ( { model
                        | hosts = Dict.union (DictFrom.listHost x.hosts) model.hosts
                        , venues = Dict.union (DictFrom.listVenue x.venues) model.venues
                        , locations = Dict.union (DictFrom.listLocation x.locations) model.locations
                        , events = Dict.union (x.events |> List.map (\event -> ( toString event.id, event )) |> Dict.fromList) model.events
                        , pools = Dict.union (DictFrom.listPool x.pools) model.pools
                        , messages = Dict.union (DictFrom.listMessage x.messages) model.messages
                        , chats = Dict.union (DictFrom.listChat x.chats) model.chats
                        , users = Dict.union (DictFrom.listUser x.users) model.users
                        , me = x.me
                      }
                    , Cmd.none
                    )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        -- MANY
        ReturnHosts response ->
            case response of
                Success x ->
                    ( { model | hosts = Dict.union (DictFrom.listHost x) model.hosts }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnVenues response ->
            case response of
                Success x ->
                    ( { model | venues = Dict.union (DictFrom.listVenue x) model.venues }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnLocations response ->
            case response of
                Success x ->
                    ( { model | locations = Dict.union (DictFrom.listLocation x) model.locations }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnEvents response ->
            case response of
                Success x ->
                    ( { model
                        | events =
                            Dict.union
                                (x
                                    |> List.map (\event -> ( toString event.id, event ))
                                    |> Dict.fromList
                                )
                                model.events
                      }
                    , Cmd.none
                    )

                -- API of GraphCool is hardcoded into listEvent
                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnPools response ->
            case response of
                Success x ->
                    ( { model | pools = Dict.union (DictFrom.listPool x) model.pools }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMessages response ->
            case response of
                Success x ->
                    ( { model | messages = Dict.union (DictFrom.listMessage x) model.messages }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnChats response ->
            case response of
                Success x ->
                    ( { model | chats = Dict.union (DictFrom.listChat x) model.chats }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnUsers response ->
            case response of
                Success x ->
                    ( { model | users = Dict.union (DictFrom.listUser x) model.users }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        -- ONE
        ReturnMe response ->
            case response of
                Success x ->
                    ( { model | me = RemoteData.toMaybe response }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnHost response ->
            case response of
                Success x ->
                    ( { model | hosts = Dict.insert (toString x.id) x model.hosts }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnVenue response ->
            case response of
                Success x ->
                    ( { model | venues = Dict.insert (toString x.id) x model.venues }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnLocation response ->
            case response of
                Success x ->
                    ( { model | locations = Dict.insert (toString x.id) x model.locations }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnEvent response ->
            case response of
                Success x ->
                    ( { model | events = Dict.insert (toString x.id) x model.events }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnPool response ->
            case response of
                Success x ->
                    ( { model | pools = Dict.insert (toString x.id) x model.pools }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMessage response ->
            case response of
                Success x ->
                    ( { model | messages = Dict.insert (toString x.id) x model.messages }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnChat response ->
            case response of
                Success x ->
                    ( { model | chats = Dict.insert (toString x.id) x model.chats }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnUser response ->
            case response of
                Success x ->
                    ( { model | users = Dict.insert (toString x.id) x model.users }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        -- MAYBE ONE
        ReturnMaybeMe response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | me = Just x }, Cmd.none )

                        Nothing ->
                            ( { model | me = Nothing }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMaybeHost response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | hosts = Dict.insert (toString x.id) x model.hosts }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMaybeVenue response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | venues = Dict.insert (toString x.id) x model.venues }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMaybeLocation response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | locations = Dict.insert (toString x.id) x model.locations }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMaybeEvent response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | events = Dict.insert (toString x.id) x model.events }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMaybePool response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | pools = Dict.insert (toString x.id) x model.pools }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMaybeMessage response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | messages = Dict.insert (toString x.id) x model.messages }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMaybeChat response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | chats = Dict.insert (toString x.id) x model.chats }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        ReturnMaybeUser response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | users = Dict.insert (toString x.id) x model.users }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )


view : Model -> Html.Html Msg
view model =
    let
        toDiv x =
            div [ style [ ( "padding", "1em" ) ] ] [ text <| Basics.toString x ]

        response =
            div []
                [ div []
                    [ h5 [] [ text "Host" ]
                    , div [] (List.map toDiv <| Dict.values model.hosts)
                    ]
                , div []
                    [ h5 [] [ text "Venues" ]
                    , div [] (List.map toDiv <| Dict.values model.venues)
                    ]
                , div []
                    [ h5 [] [ text "Locations" ]
                    , div [] (List.map toDiv <| Dict.values model.locations)
                    ]
                , div []
                    [ h5 [] [ text "Events" ]
                    , div [] (List.map toDiv <| Dict.values model.events)
                    ]
                , div []
                    [ h5 [] [ text "Messages" ]
                    , div [] (List.map toDiv <| Dict.values model.messages)
                    ]
                , div []
                    [ h5 [] [ text "Chats" ]
                    , div [] (List.map toDiv <| Dict.values model.chats)
                    ]
                , div []
                    [ h5 [] [ text "Users" ]
                    , div [] (List.map toDiv <| Dict.values model.users)
                    ]
                , div []
                    [ h5 [] [ text "Me" ]
                    , div [] [ text <| Basics.toString <| model.me ]
                    ]
                ]
    in
    div []
        [ div []
            [ h1 [] [ text "Generated Query" ]
            , pre [] [ text (Document.serializeQuery queryEverything) ]
            ]
        , div []
            [ h1 [] [ text "Generated Mutation" ]
            , pre [] [ text (Document.serializeMutation updateUserMutation) ]
            ]
        , div []
            [ h1 [] [ text "Model" ]
            , h2 [] [ text "Raw" ]
            , Html.text (Basics.toString model)
            , h2 [] [ text "Refined" ]
            , response
            ]
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }



-- ------------------- --
-- Everything Filtered --
-- ------------------- --
-- {
--   allHosts {
--     createdAt
--     description
--     events {
--       id
--     }
--     id
--     name
--     nameFull
--     users {
--       id
--     }
--     venues {
--       id
--     }
--   }
--   allVenues {
--     createdAt
--     description
--     id
--     name
--     nameFull
--   }
--   allLocations {
--     address
--     addressFull
--     city
--     country
--     createdAt
--     id
--     lat
--     lon
--     state
--     venue {
--       id
--     }
--     zip
--   }
--   allEvents {
--     pool {
--       id
--     }
--     createdAt
--     createdBy {
--       id
--     }
--     endsAt
--     hosts {
--       id
--     }
--     id
--     name
--     nameFull
--     private
--     startsAt
--     venues {
--       id
--     }
--   }
--   allPools {
--     chats {
--       id
--     }
--     event {
--       id
--     }
--     id
--     seatGeekId
--     attending {
--       id
--     }
--     liked {
--       id
--     }
--     viewed {
--       id
--     }
--   }
--   allMessages
--   (filter:
--     {chat: { OR :
--       [ {recipient: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       , {initiated: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       ]
--     }}
--   ){
--     chat {
--       id
--     }
--     createdAt
--     from {
--       id
--     }
--     id
--     text
--   }
--   allChats
--   (filter:
--     {OR:
--       [ {recipient: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       , {initiated: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       ]
--     }
--   ) {
--     canceled {
--       id
--     }
--     dateState
--     pool {
--       id
--     }
--     id
--     initiated {
--       id
--     }
--     messages {
--       id
--     }
--     passed {
--       id
--     }
--     proposed {
--       id
--     }
--     recipient {
--       id
--     }
--   }
--   allUsers
--   (filter:
--     {OR:
--       [ {recipient_some: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       , {initiated_some: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       , {attendingEvent_some:
--         	{ event:
--             { startsAt_gt : "2018-10-10T00:00:00.000Z"}
--           }
--       	}
--       ]
--     }
--   ) {
--     bio
--     birthday
--     createdAt
--     createdEvents {
--       id
--     }
--     email
--     attendingEvent {
--       id
--     }
--     likedEvent {
--       id
--     }
--     hosts {
--       id
--     }
--     id
--     name
--     nameFull
--     updatedAt
--   }
--   user {
--     auth0UserId
--     bio
--     birthday
--     createdAt
--     createdEvents {
--       id
--     }
--     datesCanceled {
--       id
--     }
--     email
--     attendingEvent {
--       id
--     }
--     likedEvent {
--       id
--     }
--     viewedEvent {
--       id
--     }
--     hosts {
--       id
--     }
--     id
--     initiated {
--       id
--     }
--     name
--     nameFull
--     passed {
--       id
--     }
--     password
--     proposed {
--       id
--     }
--     recipient {
--       id
--     }
--     sent {
--       id
--     }
--     updatedAt
--   }
-- }
