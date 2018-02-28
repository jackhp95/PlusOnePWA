module Pages.Events.Update exposing (..)

import SeatGeek.Types as SG
import Pages.Events.Model exposing (..)
import Pages.Events.Messages exposing (..)
import Pages.Event.Model exposing(Response, Event)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import GraphCool.Object.Event as Event
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.User as User
import GraphCool.Object.Venue as Venue
import RemoteData exposing (..)
import GraphCool.Query as Query
import Graphqelm.Http exposing (..)
import GraphCool.Scalar exposing (..)


update : Msg -> Events -> ( Events, Cmd Msg )
update msg model =
    case msg of
        MakeRequest ->
            (model, makeQueryRequest)
        GotResponse responseModel ->
            ({ model | eventResponse = responseModel}, Cmd.none)

query : SelectionSet Response RootQuery
query =
    Query.selection Response
        |> with (Query.allEvents event)

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
        |> with (Event.usersAttending identity userId)
        |> with (Event.usersLiked identity userId)
        |> with (Event.usersViewed identity userId)
        |> with (Event.venues identity venueId)

chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
  Chat.selection identity |> with Chat.id

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
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/OldPlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)
