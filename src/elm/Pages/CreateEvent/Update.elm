module Pages.CreateEvent.Update exposing (..)

import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.User as User
import GraphCool.Object.Venue as Venue
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Pages.CreateEvent.Messages exposing (..)
import Pages.CreateEvent.Model exposing (..)
import Pages.Event.Model exposing (..)
import RemoteData exposing (..)


query : SelectionSet Response RootQuery
query =
    Query.selection Response
        |> with (Query.allEvents identity event)


mutation : Event -> SelectionSet (Maybe Event) RootMutation
mutation model =
    let
        endDate =
            case model.endsAt of
                Nothing ->
                    Absent

                Just date ->
                    Present date

        fullName =
            case model.nameFull of
                Nothing ->
                    Absent

                Just n ->
                    Present n
    in
    Mutation.selection identity
        -- (Maybe Event)
        |> with
            (Mutation.createEvent
                --identity
                (\optionals -> { optionals | nameFull = fullName, endsAt = endDate, createdById = Present (Id "cje07e7y7e227015745hh81m3") })
                { name = model.name, startsAt = model.startsAt }
                event
            )


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


makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)


makeMutationRequest : EventModel -> Cmd Msg
makeMutationRequest model =
    mutation model.event
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotSubmitResponse)


update : Msg -> CreateEvent -> ( CreateEvent, Cmd Msg )
update msg model =
    case msg of
        MakeRequest ->
            ( model, makeRequest )

        SubmitEvent ->
            ( model, makeMutationRequest model )

        GotSubmitResponse responseModel ->
            ( { model | createdEvent = responseModel }, Cmd.none )

        GotResponse responseModel ->
            ( { model | eventResponse = responseModel }, Cmd.none )

        ChangeName newName ->
            let
                oldEvent =
                    model.event

                newEvent =
                    { oldEvent | name = newName }
            in
            ( { model | event = newEvent }, Cmd.none )

        ChangeNameFull newNameFull ->
            let
                oldEvent =
                    model.event

                newEvent =
                    { oldEvent | nameFull = Just newNameFull }
            in
            ( { model | event = newEvent }, Cmd.none )

        ChangeStartDate newDate ->
            let
                oldEvent =
                    model.event

                newEvent =
                    { oldEvent | startsAt = DateTime newDate }
            in
            ( { model | event = newEvent }, Cmd.none )

        ChangeEndDate newDate ->
            let
                oldEvent =
                    model.event

                newEvent =
                    { oldEvent | endsAt = Just (DateTime newDate) }
            in
            ( { model | event = newEvent }, Cmd.none )



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
