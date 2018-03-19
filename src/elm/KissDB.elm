module KissDB exposing (..)

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
import Graphqelm.Field exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import RemoteData exposing (..)
import Types exposing (..)


everythingQuery : SelectionSet Everything RootQuery
everythingQuery =
    Query.selection Everything
        |> with (Query.allHosts identity host)
        |> with (Query.allVenues identity venue)
        |> with (Query.allLocations identity location)
        |> with (Query.allEvents identity event)
        |> with (Query.allPools identity pool)
        |> with (Query.allMessages identity message)
        |> with (Query.allChats identity chat)
        |> with (Query.allUsers identity user)
        |> with (Query.me me)


initQuery : SelectionSet Everything RootQuery
initQuery =
    Query.selection Everything
        |> with (Query.allHosts identity host)
        |> with (Query.allVenues identity venue)
        |> with (Query.allLocations identity location)
        |> with (Query.allEvents identity event)
        |> with (Query.allPools identity pool)
        |> with (Query.allMessages identity message)
        |> with (Query.allChats identity chat)
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


hostsQuery : (Query.AllHostsOptionalArguments -> Query.AllHostsOptionalArguments) -> SelectionSet (List Host) RootQuery
hostsQuery optArgs =
    Query.selection identity
        |> with (Query.allHosts optArgs host)


venuesQuery : (Query.AllVenuesOptionalArguments -> Query.AllVenuesOptionalArguments) -> SelectionSet (List Venue) RootQuery
venuesQuery optArgs =
    Query.selection identity
        |> with (Query.allVenues optArgs venue)


locationsQuery : (Query.AllLocationsOptionalArguments -> Query.AllLocationsOptionalArguments) -> SelectionSet (List Location) RootQuery
locationsQuery optArgs =
    Query.selection identity
        |> with (Query.allLocations optArgs location)


eventsQuery : (Query.AllEventsOptionalArguments -> Query.AllEventsOptionalArguments) -> SelectionSet (List Event) RootQuery
eventsQuery optArgs =
    Query.selection identity
        |> with (Query.allEvents optArgs event)


poolsQuery : (Query.AllPoolsOptionalArguments -> Query.AllPoolsOptionalArguments) -> SelectionSet (List Pool) RootQuery
poolsQuery optArgs =
    Query.selection identity
        |> with (Query.allPools optArgs pool)


messagesQuery : (Query.AllMessagesOptionalArguments -> Query.AllMessagesOptionalArguments) -> SelectionSet (List Message) RootQuery
messagesQuery optArgs =
    Query.selection identity
        |> with (Query.allMessages optArgs message)


chatsQuery : (Query.AllChatsOptionalArguments -> Query.AllChatsOptionalArguments) -> SelectionSet (List Chat) RootQuery
chatsQuery optArgs =
    Query.selection identity
        |> with (Query.allChats optArgs chat)


usersQuery : (Query.AllUsersOptionalArguments -> Query.AllUsersOptionalArguments) -> SelectionSet (List User) RootQuery
usersQuery optArgs =
    Query.selection identity
        |> with (Query.allUsers optArgs user)


meQuery : SelectionSet (Maybe Me) RootQuery
meQuery =
    Query.selection identity
        |> with (Query.me me)


requestHosts : (Query.AllHostsOptionalArguments -> Query.AllHostsOptionalArguments) -> Cmd Msg
requestHosts optArgs =
    hostsQuery optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnHosts)


requestVenues : (Query.AllVenuesOptionalArguments -> Query.AllVenuesOptionalArguments) -> Cmd Msg
requestVenues optArgs =
    venuesQuery optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnVenues)


requestLocations : (Query.AllLocationsOptionalArguments -> Query.AllLocationsOptionalArguments) -> Cmd Msg
requestLocations optArgs =
    locationsQuery optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnLocations)


requestEvents : (Query.AllEventsOptionalArguments -> Query.AllEventsOptionalArguments) -> Cmd Msg
requestEvents optArgs =
    eventsQuery optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnEvents)


requestPools : (Query.AllPoolsOptionalArguments -> Query.AllPoolsOptionalArguments) -> Cmd Msg
requestPools optArgs =
    poolsQuery optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnPools)


requestMessages : (Query.AllMessagesOptionalArguments -> Query.AllMessagesOptionalArguments) -> Cmd Msg
requestMessages optArgs =
    messagesQuery optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnMessages)


requestChats : (Query.AllChatsOptionalArguments -> Query.AllChatsOptionalArguments) -> Cmd Msg
requestChats optArgs =
    chatsQuery optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnChats)


requestUsers : (Query.AllUsersOptionalArguments -> Query.AllUsersOptionalArguments) -> Cmd Msg
requestUsers optArgs =
    usersQuery optArgs
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnUsers)
