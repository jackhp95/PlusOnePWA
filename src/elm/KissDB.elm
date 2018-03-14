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
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import RemoteData exposing (..)
import Types exposing (..)


queryEverything : SelectionSet Everything RootQuery
queryEverything =
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
        |> with (Host.events identity event)
        |> with Host.id
        |> with Host.name
        |> with Host.nameFull
        |> with (Host.users identity userId)
        |> with (Host.venues identity venueId)


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
        |> with (Event.hosts identity hostId)
        |> with Event.id
        |> with Event.name
        |> with Event.nameFull
        |> with Event.private
        |> with Event.startsAt
        |> with (Event.venues identity venueId)


poolId : SelectionSet Id GraphCool.Object.Pool
poolId =
    Pool.selection identity |> with Pool.id


pool : SelectionSet Pool GraphCool.Object.Pool
pool =
    Pool.selection Pool
        |> with (Pool.chats identity chatId)
        |> with (Pool.event identity eventId)
        |> with Pool.id
        |> with Pool.seatGeekId
        |> with (Pool.attending identity userId)
        |> with (Pool.liked identity userId)
        |> with (Pool.viewed identity userId)


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
        |> with (Chat.messages identity message)
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
        |> with (User.createdEvents identity eventId)
        |> with User.email
        |> with (User.attendingEvent identity poolId)
        |> with (User.likedEvent identity poolId)
        |> with (User.hosts identity hostId)
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
        |> with (User.createdEvents identity eventId)
        |> with (User.datesCanceled identity chatId)
        |> with User.email
        |> with (User.attendingEvent identity poolId)
        |> with (User.likedEvent identity poolId)
        |> with (User.viewedEvent identity poolId)
        |> with (User.hosts identity hostId)
        |> with User.id
        |> with (User.initiated identity chatId)
        |> with User.name
        |> with User.nameFull
        |> with (User.passed identity chatId)
        |> with User.password
        |> with (User.proposed identity chatId)
        |> with (User.recipient identity chatId)
        |> with (User.sent identity messageId)
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
