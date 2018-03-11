module Pages.EditUser.Update exposing (..)

-- import Date.Extra.Core exposing (monthToInt)
-- import GraphCool.Enum.DateState exposing (DateState)
-- import GraphCool.Object.Location as Location
-- import GraphCool.Object.Venue as Venue
-- import GraphCool.Query as Query
-- import Graphqelm.Document as Document
-- import Json.Decode as Decode exposing (Decoder)
-- import List exposing (..)

import Auth0.Auth0 as Auth0 exposing (..)
import Date exposing (..)
import Date.Extra.Format exposing (..)
import Debug exposing (log)
import GraphCool.InputObject as IO exposing (..)
import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.Message as Message
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as UserObj
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Maybe
import Pages.EditUser.Messages exposing (..)
import Pages.User.Model exposing (..)
import RemoteData exposing (..)
import String exposing (..)


type alias Temp =
    { bio : OptionalArgument String, birthday : OptionalArgument GraphCool.Scalar.DateTime, name : OptionalArgument String, nameFull : OptionalArgument String, attendingEventIds : OptionalArgument (List GraphCool.Scalar.Id), attendingEvent : OptionalArgument (List IO.UserattendingEventPool), createdEventsIds : OptionalArgument (List GraphCool.Scalar.Id), createdEvents : OptionalArgument (List IO.UsercreatedEventsEvent), datesCanceledIds : OptionalArgument (List GraphCool.Scalar.Id), datesCanceled : OptionalArgument (List IO.UserdatesCanceledChat), hostsIds : OptionalArgument (List GraphCool.Scalar.Id), hosts : OptionalArgument (List IO.UserhostsHost), initiatedIds : OptionalArgument (List GraphCool.Scalar.Id), initiated : OptionalArgument (List IO.UserinitiatedChat), likedEventIds : OptionalArgument (List GraphCool.Scalar.Id), likedEvent : OptionalArgument (List IO.UserlikedEventPool), passedIds : OptionalArgument (List GraphCool.Scalar.Id), passed : OptionalArgument (List IO.UserpassedChat), proposedIds : OptionalArgument (List GraphCool.Scalar.Id), proposed : OptionalArgument (List IO.UserproposedChat), recipientIds : OptionalArgument (List GraphCool.Scalar.Id), recipient : OptionalArgument (List IO.UserrecipientChat), sentIds : OptionalArgument (List GraphCool.Scalar.Id), sent : OptionalArgument (List IO.UsersentMessage), viewedEventIds : OptionalArgument (List GraphCool.Scalar.Id), viewedEvent : OptionalArgument (List IO.UserviewedEventPool) } -> { bio : OptionalArgument String, birthday : OptionalArgument GraphCool.Scalar.DateTime, name : OptionalArgument String, nameFull : OptionalArgument String, attendingEventIds : OptionalArgument (List GraphCool.Scalar.Id), attendingEvent : OptionalArgument (List IO.UserattendingEventPool), createdEventsIds : OptionalArgument (List GraphCool.Scalar.Id), createdEvents : OptionalArgument (List IO.UsercreatedEventsEvent), datesCanceledIds : OptionalArgument (List GraphCool.Scalar.Id), datesCanceled : OptionalArgument (List IO.UserdatesCanceledChat), hostsIds : OptionalArgument (List GraphCool.Scalar.Id), hosts : OptionalArgument (List IO.UserhostsHost), initiatedIds : OptionalArgument (List GraphCool.Scalar.Id), initiated : OptionalArgument (List IO.UserinitiatedChat), likedEventIds : OptionalArgument (List GraphCool.Scalar.Id), likedEvent : OptionalArgument (List IO.UserlikedEventPool), passedIds : OptionalArgument (List GraphCool.Scalar.Id), passed : OptionalArgument (List IO.UserpassedChat), proposedIds : OptionalArgument (List GraphCool.Scalar.Id), proposed : OptionalArgument (List IO.UserproposedChat), recipientIds : OptionalArgument (List GraphCool.Scalar.Id), recipient : OptionalArgument (List IO.UserrecipientChat), sentIds : OptionalArgument (List GraphCool.Scalar.Id), sent : OptionalArgument (List IO.UsersentMessage), viewedEventIds : OptionalArgument (List GraphCool.Scalar.Id), viewedEvent : OptionalArgument (List IO.UserviewedEventPool) }


update : Msg -> UserModel -> Me -> ( UserModel, Cmd Msg )
update msg model me =
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
            ( model, makeMutationRequest me )

        MutateUser response ->
            ( { model | userMutation = response }, Cmd.none )



-- Pages.EditUser.Messages.CreateUser ->
--     ( model, makeMutationRequest model )


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


mutation : Me -> SelectionSet (Maybe User) RootMutation
mutation me =
    log (toString me.user.user.id) <|
        let
            idtoken =
                case me.authModel.state of
                    Auth0.LoggedIn loggedInUser ->
                        loggedInUser.idtoken

                    Auth0.LoggedOut ->
                        ""
        in
        Mutation.selection identity
            |> with
                (Mutation.updateOrCreateUser
                    { update = IO.UpdateUser { bio = Absent, birthday = Absent, id = me.user.user.id, name = Present "Alex1", nameFull = Absent, attendingEventIds = Absent, attendingEvent = Absent, createdEventsIds = Absent, createdEvents = Absent, datesCanceledIds = Absent, datesCanceled = Absent, hostsIds = Absent, hosts = Absent, initiatedIds = Absent, initiated = Absent, likedEventIds = Absent, likedEvent = Absent, passedIds = Absent, passed = Absent, proposedIds = Absent, proposed = Absent, recipientIds = Absent, recipient = Absent, sentIds = Absent, sent = Absent, viewedEventIds = Absent, viewedEvent = Absent }
                    , create =
                        IO.CreateUser
                            { bio = Absent, birthday = DateTime "2018-10-10", name = "name", nameFull = Absent, attendingEventIds = Absent, attendingEvent = Absent, createdEventsIds = Absent, createdEvents = Absent, datesCanceledIds = Absent, datesCanceled = Absent, hostsIds = Absent, hosts = Absent, initiatedIds = Absent, initiated = Absent, likedEventIds = Absent, likedEvent = Absent, passedIds = Absent, passed = Absent, proposedIds = Absent, proposed = Absent, recipientIds = Absent, recipient = Absent, sentIds = Absent, sent = Absent, viewedEventIds = Absent, viewedEvent = Absent }
                    }
                    user
                )



--authProvider = IO.AuthProviderSignupData { auth0 = Present (IO.AuthProviderAuth0 { idToken = idtoken }), email = Absent }


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


makeMutationRequest : Me -> Cmd Msg
makeMutationRequest me =
    mutation me
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> MutateUser)
