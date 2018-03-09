module Pages.EditUser.Update exposing (..)

import Date exposing (..)
import Date.Extra.Format exposing (..)
import GraphCool.InputObject as IO exposing (..)
import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.Location as Location
import GraphCool.Object.Message as Message
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as UserObj
import GraphCool.Object.Venue as Venue
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Json.Decode as Decode exposing (Decoder)
import List exposing (..)
import Maybe
import Pages.EditUser.Messages exposing (..)
import Pages.User.Model exposing (..)
import RemoteData exposing (..)
import String exposing (..)


type alias Temp =
    { bio : OptionalArgument String, birthday : OptionalArgument GraphCool.Scalar.DateTime, name : OptionalArgument String, nameFull : OptionalArgument String, attendingEventIds : OptionalArgument (List GraphCool.Scalar.Id), attendingEvent : OptionalArgument (List IO.UserattendingEventPool), createdEventsIds : OptionalArgument (List GraphCool.Scalar.Id), createdEvents : OptionalArgument (List IO.UsercreatedEventsEvent), datesCanceledIds : OptionalArgument (List GraphCool.Scalar.Id), datesCanceled : OptionalArgument (List IO.UserdatesCanceledChat), hostsIds : OptionalArgument (List GraphCool.Scalar.Id), hosts : OptionalArgument (List IO.UserhostsHost), initiatedIds : OptionalArgument (List GraphCool.Scalar.Id), initiated : OptionalArgument (List IO.UserinitiatedChat), likedEventIds : OptionalArgument (List GraphCool.Scalar.Id), likedEvent : OptionalArgument (List IO.UserlikedEventPool), passedIds : OptionalArgument (List GraphCool.Scalar.Id), passed : OptionalArgument (List IO.UserpassedChat), proposedIds : OptionalArgument (List GraphCool.Scalar.Id), proposed : OptionalArgument (List IO.UserproposedChat), recipientIds : OptionalArgument (List GraphCool.Scalar.Id), recipient : OptionalArgument (List IO.UserrecipientChat), sentIds : OptionalArgument (List GraphCool.Scalar.Id), sent : OptionalArgument (List IO.UsersentMessage), viewedEventIds : OptionalArgument (List GraphCool.Scalar.Id), viewedEvent : OptionalArgument (List IO.UserviewedEventPool) } -> { bio : OptionalArgument String, birthday : OptionalArgument GraphCool.Scalar.DateTime, name : OptionalArgument String, nameFull : OptionalArgument String, attendingEventIds : OptionalArgument (List GraphCool.Scalar.Id), attendingEvent : OptionalArgument (List IO.UserattendingEventPool), createdEventsIds : OptionalArgument (List GraphCool.Scalar.Id), createdEvents : OptionalArgument (List IO.UsercreatedEventsEvent), datesCanceledIds : OptionalArgument (List GraphCool.Scalar.Id), datesCanceled : OptionalArgument (List IO.UserdatesCanceledChat), hostsIds : OptionalArgument (List GraphCool.Scalar.Id), hosts : OptionalArgument (List IO.UserhostsHost), initiatedIds : OptionalArgument (List GraphCool.Scalar.Id), initiated : OptionalArgument (List IO.UserinitiatedChat), likedEventIds : OptionalArgument (List GraphCool.Scalar.Id), likedEvent : OptionalArgument (List IO.UserlikedEventPool), passedIds : OptionalArgument (List GraphCool.Scalar.Id), passed : OptionalArgument (List IO.UserpassedChat), proposedIds : OptionalArgument (List GraphCool.Scalar.Id), proposed : OptionalArgument (List IO.UserproposedChat), recipientIds : OptionalArgument (List GraphCool.Scalar.Id), recipient : OptionalArgument (List IO.UserrecipientChat), sentIds : OptionalArgument (List GraphCool.Scalar.Id), sent : OptionalArgument (List IO.UsersentMessage), viewedEventIds : OptionalArgument (List GraphCool.Scalar.Id), viewedEvent : OptionalArgument (List IO.UserviewedEventPool) }


update : Msg -> UserModel -> ( UserModel, Cmd Msg )
update msg model =
    case msg of
        ChangeName newName ->
            let
                oldUser =
                    model.user

                newUser =
                    { oldUser | name = newName }
            in
            ( { model | user = newUser }
            , Cmd.none
            )

        ChangeFullName newFullName ->
            let
                oldUser =
                    model.user

                newUser =
                    { oldUser | nameFull = Just newFullName }
            in
            ( { model | user = newUser }
            , Cmd.none
            )

        ChangeBio newBio ->
            let
                oldUser =
                    model.user

                newUser =
                    { oldUser | bio = Just newBio }
            in
            ( { model | user = newUser }
            , Cmd.none
            )

        ChangeBirthday newBirthday ->
            let
                oldUser =
                    model.user

                newUser =
                    { oldUser | birthday = DateTime newBirthday }
            in
            ( { model | user = newUser }
            , Cmd.none
            )

        SaveEdit ->
            ( model, makeMutationRequest model )

        MutateUser response ->
            ( { model | userMutation = response }, Cmd.none )

        Pages.EditUser.Messages.CreateUser ->
            ( model, makeMutationRequest model )


getUserBirthday : Maybe Date -> String
getUserBirthday user =
    case user of
        Nothing ->
            ""

        Just birthday ->
            isoDateString birthday


stringToGender : String -> Gender
stringToGender gender =
    case gender of
        "Male" ->
            Male

        "Female" ->
            Female

        _ ->
            Male


reformatDate : String -> String
reformatDate date =
    case String.split "-" date of
        [ year, month, day ] ->
            String.join "/" [ month, day, year ]

        _ ->
            ""


mutation : User -> SelectionSet (Maybe User) RootMutation
mutation userModel =
    Mutation.selection identity
        -- (Maybe Event)
        |> with
            (Mutation.updateUser
                --identity
                (\optionals -> { optionals | name = Present userModel.name })
                { id = Id "cje4udnbk4wyb0177nm4fv22a" }
                user
            )



--{ name = userModel.name, birthday = userModel.birthday, authProvider = IO.AuthProviderSignupData { auth0 = Null, email = Present (IO.AuthProviderEmail { email = "elm@elm.org", password = "elm" })} } user)
--{ bio = Present, birthday = Absent, name = Absent, nameFull = Absent, createdEventsIds = Absent, createdEvents = Absent, datesCanceledIds = Absent, datesCanceled = Absent, eventsAttendingIds = Absent, eventsAttending = Absent, eventsLikedIds = Absent, eventsLiked = Absent, eventsViewedIds = Absent, eventsViewed = Absent, hostsIds = Absent, hosts = Absent, initiatedIds = Absent, initiated = Absent, passedIds = Absent, passed = Absent, proposedIds = Absent, proposed = Absent, recipientIds = Absent, recipient = Absent, sentIds = Absent, sent = Absent }
-- let
--     filledInOptionals =
--         identity { bio = Present, birthday = Absent, name = Absent, nameFull = Absent, createdEventsIds = Absent, createdEvents = Absent, datesCanceledIds = Absent, datesCanceled = Absent, eventsAttendingIds = Absent, eventsAttending = Absent, eventsLikedIds = Absent, eventsLiked = Absent, eventsViewedIds = Absent, eventsViewed = Absent, hostsIds = Absent, hosts = Absent, initiatedIds = Absent, initiated = Absent, passedIds = Absent, passed = Absent, proposedIds = Absent, proposed = Absent, recipientIds = Absent, recipient = Absent, sentIds = Absent, sent = Absent }
--     optionalArgs =
--         [ Argument.optional "bio" filledInOptionals.bio Encode.string, Argument.optional "birthday" filledInOptionals.birthday (\(GraphCool.Scalar.DateTime raw) -> Encode.string raw), Argument.optional "name" filledInOptionals.name Encode.string, Argument.optional "nameFull" filledInOptionals.nameFull Encode.string, Argument.optional "createdEventsIds" filledInOptionals.createdEventsIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "createdEvents" filledInOptionals.createdEvents (IO.encodeUsercreatedEventsEvent |> Encode.list), Argument.optional "datesCanceledIds" filledInOptionals.datesCanceledIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "datesCanceled" filledInOptionals.datesCanceled (IO.encodeUserdatesCanceledChat |> Encode.list), Argument.optional "eventsAttendingIds" filledInOptionals.eventsAttendingIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "eventsAttending" filledInOptionals.eventsAttending (IO.encodeUsereventsAttendingEvent |> Encode.list), Argument.optional "eventsLikedIds" filledInOptionals.eventsLikedIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "eventsLiked" filledInOptionals.eventsLiked (IO.encodeUsereventsLikedEvent |> Encode.list), Argument.optional "eventsViewedIds" filledInOptionals.eventsViewedIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "eventsViewed" filledInOptionals.eventsViewed (IO.encodeUsereventsViewedEvent |> Encode.list), Argument.optional "hostsIds" filledInOptionals.hostsIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "hosts" filledInOptionals.hosts (IO.encodeUserhostsHost |> Encode.list), Argument.optional "initiatedIds" filledInOptionals.initiatedIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "initiated" filledInOptionals.initiated (IO.encodeUserinitiatedChat |> Encode.list), Argument.optional "passedIds" filledInOptionals.passedIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "passed" filledInOptionals.passed (IO.encodeUserpassedChat |> Encode.list), Argument.optional "proposedIds" filledInOptionals.proposedIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "proposed" filledInOptionals.proposed (IO.encodeUserproposedChat |> Encode.list), Argument.optional "recipientIds" filledInOptionals.recipientIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "recipient" filledInOptionals.recipient (IO.encodeUserrecipientChat |> Encode.list), Argument.optional "sentIds" filledInOptionals.sentIds ((\(GraphCool.Scalar.Id raw) -> Encode.string raw) |> Encode.list), Argument.optional "sent" filledInOptionals.sent (IO.encodeUsersentMessage |> Encode.list) ]
--             |> List.filterMap identity
-- in
-- filledInOptionals


poolId : SelectionSet Id GraphCool.Object.Pool
poolId =
    Pool.selection identity |> with Pool.id


user : SelectionSet User GraphCool.Object.User
user =
    UserObj.selection User
        |> with UserObj.auth0UserId
        |> with UserObj.bio
        |> with UserObj.birthday
        |> with UserObj.createdAt
        |> with (UserObj.createdEvents identity eventId)
        |> with (UserObj.datesCanceled identity chatId)
        |> with UserObj.email
        |> with (UserObj.attendingEvent identity poolId)
        |> with (UserObj.likedEvent identity poolId)
        |> with (UserObj.viewedEvent identity poolId)
        |> with (UserObj.hosts identity hostId)
        |> with UserObj.id
        |> with (UserObj.initiated identity chatId)
        |> with UserObj.name
        |> with UserObj.nameFull
        |> with (UserObj.passed identity chatId)
        |> with UserObj.password
        |> with (UserObj.proposed identity chatId)
        |> with (UserObj.recipient identity chatId)
        |> with (UserObj.sent identity messageId)
        |> with UserObj.updatedAt


chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
    Chat.selection identity |> with Chat.id


eventId : SelectionSet Id GraphCool.Object.Event
eventId =
    Event.selection identity |> with Event.id


hostId : SelectionSet Id GraphCool.Object.Host
hostId =
    Host.selection identity |> with Host.id


messageId : SelectionSet Id GraphCool.Object.Message
messageId =
    Message.selection identity |> with Message.id


makeMutationRequest : UserModel -> Cmd Msg
makeMutationRequest model =
    mutation model.user
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/OldPlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> MutateUser)
