module Pages.Events.Update exposing (..)

import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as User
import GraphCool.Object.Venue as Venue
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Pages.Event.Model exposing (Event, Response)
import Pages.Events.Messages exposing (..)
import Pages.Events.Model exposing (..)
import Pages.Pool.Model exposing (Pool)
import Pages.User.Model exposing (Me,UserProfile)
import RemoteData exposing (..)
import SeatGeek.Types as SG


update : Msg -> Events -> Me -> ( Events, Cmd Msg )
update msg model me =
    case msg of
        MakeRequest ->
            ( model, makeQueryRequest )

        GotResponse responseModel ->
            ( { model | eventResponse = responseModel }, Cmd.none )


query : SelectionSet Response RootQuery
query =
    Query.selection Response
        |> with (Query.allEvents identity event)

event : SelectionSet Event GraphCool.Object.Event
event =
    Event.selection Event
        |> with (Event.chats identity chatId)
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
        |> with (Event.pool identity pool)

pool : SelectionSet Pool GraphCool.Object.Pool
pool = 
    Pool.selection Pool
        |> with Pool.id
        |> with (Pool.event identity eventId)
        |> with (Pool.attending identity user)

user : SelectionSet UserProfile GraphCool.Object.User
user =
    User.selection UserProfile
        |> with User.bio
        |> with User.birthday
        |> with User.id
        |> with User.name
        |> with User.nameFull

chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
    Chat.selection identity |> with Chat.id

eventId : SelectionSet Id GraphCool.Object.Event
eventId =
    Event.selection identity |> with Event.id

userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id


hostId : SelectionSet Id GraphCool.Object.Host
hostId =
    Host.selection identity |> with Host.id


venueId : SelectionSet Id GraphCool.Object.Venue
venueId =
    Venue.selection identity |> with Venue.id


makeQueryRequest : Cmd Msg
makeQueryRequest =
    query
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)
