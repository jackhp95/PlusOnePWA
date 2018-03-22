module Auth0.Authentication
    exposing
        ( Model
        , Msg(..)
        , handleAuthResult
        , init
        , isLoggedIn
        , tryGetUserProfile
        , update
        )

-- import Debug exposing (log)
-- import GraphCool.Enum.DateState exposing (DateState)
-- import GraphCool.Enum.MessageOrderBy exposing (..)
-- import GraphCool.InputObject as IO exposing (..)
-- import GraphCool.Mutation as Mutation
-- import GraphCool.Object.Location as Location
-- import GraphCool.Object.Venue as Venue
-- import Graphqelm.Document as Document
-- import Pages.Event.Model exposing (Event, Response)

import Auth0.Auth0 as Auth0
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.Message as Message
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as UserObj
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import RemoteData exposing (..)


type alias Model =
    { state : Auth0.AuthenticationState
    , lastError : Maybe Auth0.AuthenticationError
    , authorize : Auth0.Options -> Cmd Msg
    , logOut : () -> Cmd Msg
    , createUserResponse : SubmitResponseModel
    , getUserId : Id
    , maybeRetrievedMe: Maybe User
    }
init : (Auth0.Options -> Cmd Msg) -> (() -> Cmd Msg) -> Maybe Auth0.LoggedInUser -> Model
init authorize logOut initialData =
    { state =
        case initialData of
            Just user ->
                Auth0.LoggedIn user

            Nothing ->
                Auth0.LoggedOut
    , lastError = Nothing
    , authorize = authorize
    , logOut = logOut
    , createUserResponse = RemoteData.Loading
    , getUserId = Id "0"
    , maybeRetrievedMe = Nothing
    }


type Msg
    = AuthenticationResult Auth0.AuthenticationResult
    | ShowLogIn
    | LogOut
    | GetUser SubmitResponseModel


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AuthenticationResult result ->
            let
                ( newState, error ) =
                    case result of
                        Ok user ->
                            ( Auth0.LoggedIn user, Nothing )

                        Err err ->
                            ( model.state, Just err )
            in
            ( { model | state = newState, lastError = error }, queryUserIdToken newState )

        ShowLogIn ->
            ( model, model.authorize Auth0.defaultOpts )

        LogOut ->
            ( { model | state = Auth0.LoggedOut }, model.logOut () )

        GetUser response ->
            let
                responseId =
                    case response of
                        NotAsked ->
                            Id "0"

                        Loading ->
                            Id "1"

                        Failure e ->
                            Id "2"

                        Success a ->
                            case a of
                                Nothing ->
                                    Id "3"

                                Just user ->
                                    user.id

                maybeRetrievedMe = 
                    case response of
                        Success maybeUser ->
                            maybeUser
                        _ -> 
                            Nothing

            in
            ( { model | getUserId = responseId, maybeRetrievedMe = maybeRetrievedMe }, Cmd.none )


type alias SubmitResponseModel =
    RemoteData Graphqelm.Http.Error (Maybe User)


handleAuthResult : Auth0.RawAuthenticationResult -> Msg
handleAuthResult =
    Auth0.mapResult >> AuthenticationResult


tryGetUserProfile : Model -> Maybe Auth0.UserProfile
tryGetUserProfile model =
    case model.state of
        Auth0.LoggedIn user ->
            Just user.profile

        Auth0.LoggedOut ->
            Nothing


isLoggedIn : Model -> Bool
isLoggedIn model =
    case model.state of
        Auth0.LoggedIn _ ->
            True

        Auth0.LoggedOut ->
            False


queryUserIdToken : Auth0.AuthenticationState -> Cmd Msg
queryUserIdToken authState =
    case authState of
        Auth0.LoggedIn loggedInUser ->
            queryUserIdTokenSelect loggedInUser
                |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
                |> Graphqelm.Http.send (RemoteData.fromResult >> GetUser)

        Auth0.LoggedOut ->
            Cmd.none


queryUserIdTokenSelect : Auth0.LoggedInUser -> SelectionSet (Maybe User) RootQuery
queryUserIdTokenSelect loggedInUser =
    Query.selection identity
        |> with (Query.user (\optionals -> { optionals | auth0UserId = Present loggedInUser.idtoken }) user)


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


poolId : SelectionSet Id GraphCool.Object.Pool
poolId =
    Pool.selection identity |> with Pool.id


type alias User =
    { auth0UserId : Maybe String
    , bio : Maybe String
    , birthday : DateTime
    , createdAt : DateTime
    , createdEvents : Maybe (List Id)
    , datesCanceled : Maybe (List Id)
    , email : Maybe String
    , attendingEvent : Maybe (List Id)
    , likedEvent : Maybe (List Id)
    , viewedEvent : Maybe (List Id)
    , hosts : Maybe (List Id)
    , id : Id
    , initiated : Maybe (List Id)
    , name : String
    , nameFull : Maybe String
    , passed : Maybe (List Id)
    , password : Maybe String
    , proposed : Maybe (List Id)
    , recipient : Maybe (List Id)
    , sent : Maybe (List Id)
    , updatedAt : DateTime
    }


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
