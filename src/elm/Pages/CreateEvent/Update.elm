module Pages.CreateEvent.Update exposing (..)

import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.User as User
import GraphCool.Object.Venue as Venue
import GraphCool.Object.Pool as Pool
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Pages.CreateEvent.Messages exposing (..)
import Pages.CreateEvent.Model exposing (..)
import Pages.Event.Model exposing (..)
import Pages.Pool.Model exposing (..)
import RemoteData exposing (..)

mutation : Event -> SelectionSet (Maybe NewEvent) RootMutation
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
                newEvent
            )


newEvent : SelectionSet NewEvent GraphCool.Object.Event
newEvent =
    Event.selection NewEvent
        |> with (Event.createdBy identity userId)
        |> with Event.endsAt
        |> with Event.name
        |> with Event.nameFull
        |> with Event.startsAt

userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id

makeMutationRequest : EventModel -> Cmd Msg
makeMutationRequest model =
    -- let
    --     newEvent = 
    --         NewEvent 
    --             model.createdBy 
    --             model.endsAt 
    --             model.name 
    --             model.nameFull
    --             model.startsAt
    -- in
    mutation model.event
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotSubmitResponse)


update : Msg -> CreateEvent -> ( CreateEvent, Cmd Msg )
update msg model =
    case msg of
        SubmitEvent ->
            ( model, makeMutationRequest model )

        GotSubmitResponse responseModel ->
            ( { model | createdEvent = responseModel }, Cmd.none )

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
