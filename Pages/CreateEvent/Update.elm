module Pages.CreateEvent.Update exposing (..)

import SeatGeek.Types as SG
import Pages.CreateEvent.Model exposing (..)
import Pages.CreateEvent.Messages exposing (..)
import Pages.Event.Model exposing (..)
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




query : SelectionSet Response RootQuery
query =
    Query.selection Response
        |> with (Query.allEvents event)

-- querySubmit : Selection SubmitResponse RootQuery
-- querySubmit =
--     Mutation.selection SubmitResponse
--         |> with (Mutation.createEvent )

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
-- { chats : List String
-- , createAt : GraphCool.Scalar.DateTime
-- , createdBy : String
-- , endsAt : GraphCool.Scalar.DateTime
-- , hosts : List String
-- , id : GraphCool.Scalar.Id
-- , name : String
-- , nameFull : String
-- , private : Bool
-- , startsAt : GraphCool.Scalar.DateTime
-- , usersAttending : List String
-- , usersLiked : List String
-- , usersViewed : List String
-- , venues : List String
-- }

makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)

update : Msg -> CreateEvent -> ( CreateEvent, Cmd Msg )
update msg model =
    case msg of
        MakeRequest ->
            (model, makeRequest)
        GotResponse responseModel ->
            ({ model | eventResponse = responseModel}, Cmd.none)
        SubmitEvent e ->
            ( model , Cmd.none )
        ChangeName newName ->
            let
              oldEvent = model.event
              newEvent =
                { oldEvent | name = newName }
            in
            ( { model | event = newEvent} , Cmd.none)
        ChangeNameFull newNameFull ->
            let
              oldEvent = model.event
              newEvent =
                { oldEvent | nameFull = Just newNameFull }
            in
            ( { model | event = newEvent} , Cmd.none)
        -- ChangeLocation newLocation ->
        --     ( { model | location = newLocation }, Cmd.none)
        -- ChangeDate newDate ->
        --     ( { model | date = newDate }, Cmd.none)
        -- ChangeTime newTime ->
        --     ( { model | time = newTime }, Cmd.none)
        -- ChangePrivacy newPrivacy ->
        --     ( { model | privacy = newPrivacy }, Cmd.none)
        -- ChangeTaxonomy newTaxonomy ->
        --     ( { model | taxonomy = newTaxonomy }, Cmd.none)
