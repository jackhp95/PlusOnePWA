module Update exposing (..)

-- import Auth0.Authentication as Authentication

import Auth0.Auth0 as Auth0
import Debug exposing (log)
import EveryDict exposing (..)
import GraphCool.InputObject exposing (..)
import GraphCool.Mutation as Mutation
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present), fromMaybe)
import Graphqelm.SelectionSet as SelectionSet exposing (SelectionSet, with)
import Helpers.From as From exposing (..)
import Helpers.KissDB as DB exposing (..)
import Navigation as Nav
import RemoteData exposing (..)
import Types exposing (..)


-- HELPERS


goTo : Model -> Route -> String -> ( Model, Cmd msg )
goTo model route url =
    ( { model | route = log "Route change undertaken: " route }, Nav.newUrl url )



-- for development purposes - if on then logged in user can only see loggout out stuff until we have a way for them to add their profile data


authOff : Bool
authOff =
    False



-- UPDATE --


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        route =
            model.route

        hosts =
            model.hosts

        venues =
            model.venues

        locations =
            model.locations

        events =
            model.events

        pools =
            model.pools

        messages =
            model.messages

        chats =
            model.chats

        users =
            model.users

        forms =
            model.forms

        maybeMe =
            model.me

        auth =
            model.auth

        errors =
            model.errors

        maybeMeListId =
            case maybeMe of
                Nothing ->
                    Nothing

                Just me ->
                    Just [ me.id ]
    in
    case msg of
        RouteTo newRoute ->
            let
                basicRoute =
                    ( { model | route = newRoute }, Cmd.none )

                goEventUpdate eventId =
                    case eventId of
                        Nothing ->
                            basicRoute

                        Just eventId ->
                            case EveryDict.get eventId events of
                                Just api ->
                                    case api of
                                        GraphCool event ->
                                            basicRoute

                                        SeatGeek event ->
                                            let
                                                createSGPool =
                                                    Mutation.selection identity
                                                        |> with
                                                            (Mutation.createPool
                                                                (\poolOptionals ->
                                                                    { poolOptionals
                                                                        | seatGeekId = Present <| From.idToString event.id
                                                                        , viewedIds = fromMaybe maybeMeListId
                                                                    }
                                                                )
                                                                DB.pool
                                                            )

                                                createSGPoolRequest =
                                                    createSGPool
                                                        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
                                                        |> Graphqelm.Http.send
                                                            (RemoteData.fromResult >> ReturnMaybePool)

                                                createSeatGeekPoolIfMissing =
                                                    case EveryDict.get event.id pools of
                                                        Nothing ->
                                                            createSGPoolRequest

                                                        Just _ ->
                                                            Cmd.none
                                            in
                                            ( { model | route = newRoute }, createSeatGeekPoolIfMissing )

                                _ ->
                                    basicRoute
            in
            case maybeMe of
                Nothing ->
                    case newRoute of
                        GoEvents eventId ->
                            goEventUpdate eventId

                        _ ->
                            case model.auth.state of
                                Auth0.LoggedIn data ->
                                    ( { model | route = GoEditMe }, Cmd.none )

                                Auth0.LoggedOut ->
                                    -- The logic resting above is for the places users can go without auth.
                                    -- THIS IS HOW A USER IS ROUTED TO LOG IN IF THEY ARE NOT CURRENTLY LOGGED IN
                                    ( model, model.auth.authorize Auth0.defaultOpts )

                -- The logic below is the places users can go when authenticated.
                Just me ->
                    case newRoute of
                        GoLogOut ->
                            ( { model | auth = { auth | state = Auth0.LoggedOut }, me = Nothing }, model.auth.logOut () )

                        GoEvents eventId ->
                            goEventUpdate eventId

                        GoPool pool ->
                            let
                                attendingEvent =
                                    Mutation.selection identity
                                        |> with
                                            (Mutation.addToAttendingEvent
                                                { attendingUserId = me.id, attendingEventPoolId = pool.id }
                                                SelectionSet.empty
                                            )

                                attendingEventRequest =
                                    attendingEvent
                                        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
                                        |> Graphqelm.Http.send
                                            (RemoteData.fromResult >> ReturnMaybeEmpty)
                            in
                            ( { model
                                | route = newRoute
                                , pools =
                                    EveryDict.insert
                                        pool.id
                                        { pool | usersAttending = me.id :: pool.usersAttending }
                                        pools
                                , me = Just { me | attendingEvent = pool.id :: me.attendingEvent }
                              }
                            , attendingEventRequest
                            )

                        _ ->
                            basicRoute

        -- ( { model | route = newRoute }
        -- , Nav.newUrl newRoute)
        --)
        UpdateValue input ->
            let
                forms =
                    model.forms

                eventForm =
                    forms.eventForm

                meForm =
                    forms.meForm
            in
            case input of
                -- Me
                MeName val ->
                    ( { model | forms = { forms | meForm = { meForm | name = val } } }, Cmd.none )

                MeNameFull val ->
                    ( { model | forms = { forms | meForm = { meForm | nameFull = Just val } } }, Cmd.none )

                MeBio val ->
                    ( { model | forms = { forms | meForm = { meForm | bio = Just val } } }, Cmd.none )

                MeBirthday val ->
                    ( { model | forms = { forms | meForm = { meForm | birthday = DateTime val } } }, Cmd.none )

                MeSubmit ->
                    ( model, Cmd.none {- Create/UpdateUser Mutation Cmd goes here -} )

                -- Message
                MessageRefresh chatId ->
                    ( model, DB.requestMessages identity )

                -- Use the ChatId for the key of the message you're composing.
                -- This allows you to have mutliple different message states, not just one.
                -- Switching between chats should keep the message you're composing separate with this tactic.
                MessageText chatId val ->
                    case val == "" of
                        False ->
                            ( { model | messages = EveryDict.insert chatId { initMessage | text = val } model.messages }, Cmd.none )

                        True ->
                            ( { model | messages = EveryDict.remove chatId model.messages }, Cmd.none )

                MessageSend chatId meId message ->
                    let
                        createMessage =
                            Mutation.selection identity
                                |> with
                                    (Mutation.createMessage
                                        (\messageOptionals ->
                                            { messageOptionals
                                                | chatId = Present chatId
                                                , fromId = Present meId
                                            }
                                        )
                                        { text = message.text }
                                        DB.message
                                    )

                        createMessageRequest =
                            createMessage
                                |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
                                |> Graphqelm.Http.send
                                    (RemoteData.fromResult >> ReturnMaybeMessage)
                    in
                    ( { model | messages = EveryDict.remove chatId model.messages }, createMessageRequest )

                -- Event
                EventName val ->
                    ( { model | forms = { forms | eventForm = { eventForm | name = val } } }, Cmd.none )

                EventNameFull val ->
                    ( { model | forms = { forms | eventForm = { eventForm | nameFull = Just val } } }, Cmd.none )

                EventStartDate val ->
                    ( { model | forms = { forms | eventForm = { eventForm | startsAt = DateTime val } } }, Cmd.none )

                EventEndDate val ->
                    ( { model | forms = { forms | eventForm = { eventForm | endsAt = Just <| DateTime val } } }, Cmd.none )

                EventSubmit ->
                    let
                        composeEvent =
                            Mutation.selection identity
                                |> with
                                    (Mutation.createEvent
                                        (\eventOptionals ->
                                            { eventOptionals
                                                | endsAt = fromMaybe eventForm.endsAt
                                                , nameFull = fromMaybe eventForm.nameFull
                                                , private = Present eventForm.private
                                                , createdById = Present <| Id "cjepixltacwzz0153vxgep8pb"
                                                , pool =
                                                    Present <|
                                                        EventpoolPool
                                                            { attendingIds = Present [ Id "cjepixltacwzz0153vxgep8pb" ]
                                                            , chats = Absent
                                                            , chatsIds = Absent
                                                            , likedIds = Absent
                                                            , seatGeekId = Absent
                                                            , viewedIds = Absent
                                                            }
                                                , hostsIds = Absent
                                                , venuesIds = Absent
                                            }
                                        )
                                        { name = eventForm.name, startsAt = eventForm.startsAt }
                                        DB.event
                                    )

                        sendCreateEventRequest =
                            composeEvent
                                |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
                                |> Graphqelm.Http.send
                                    (RemoteData.fromResult >> ReturnMaybeEvent)
                    in
                    ( { model | forms = { forms | eventForm = initEvent } }, sendCreateEventRequest )

        -- Everything
        ReturnEverything response ->
            case response of
                Success x ->
                    ( { model
                        | hosts = EveryDict.union (From.listHostToDict x.hosts) model.hosts
                        , venues = EveryDict.union (From.listVenueToDict x.venues) model.venues
                        , locations = EveryDict.union (From.listLocationToDict x.locations) model.locations
                        , events = EveryDict.union (x.events |> List.map (\event -> ( event.id, GraphCool event )) |> EveryDict.fromList) model.events
                        , pools = EveryDict.union (From.listPoolToDict x.pools) model.pools
                        , messages = EveryDict.union (From.listMessageToDict x.messages) model.messages
                        , chats = EveryDict.union (From.listChatToDict x.chats) model.chats
                        , users = EveryDict.union (From.listUserToDict x.users) model.users
                        , me =
                            if x.me == Nothing then
                                -- Don't overwrite current user if GraphCool returns Nothing instead of Me
                                maybeMe
                            else
                                x.me
                      }
                    , Cmd.none
                    )

                Failure y ->
                    ( { model | errors = toString y :: model.errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: model.errors }, Cmd.none )

        -- MANY
        ReturnHosts response ->
            case response of
                Success x ->
                    ( { model | hosts = EveryDict.union (From.listHostToDict x) hosts }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnVenues response ->
            case response of
                Success x ->
                    ( { model | venues = EveryDict.union (From.listVenueToDict x) venues }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnLocations response ->
            case response of
                Success x ->
                    ( { model | locations = EveryDict.union (From.listLocationToDict x) locations }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnEvents response ->
            case response of
                Success x ->
                    ( { model | events = EveryDict.union (From.listEventToDict x) events }, Cmd.none )

                -- API of GraphCool is hardcoded into listEvent
                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnPools response ->
            case response of
                Success x ->
                    ( { model | pools = EveryDict.union (From.listPoolToDict x) pools }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMessages response ->
            case response of
                Success x ->
                    ( { model | messages = EveryDict.union (From.listMessageToDict x) messages }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnChats response ->
            case response of
                Success x ->
                    ( { model | chats = EveryDict.union (From.listChatToDict x) chats }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnUsers response ->
            case response of
                Success x ->
                    ( { model | users = EveryDict.union (From.listUserToDict x) users }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        -- ONE
        ReturnMe response ->
            case response of
                Success x ->
                    ( { model | me = RemoteData.toMaybe response }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnHost response ->
            case response of
                Success x ->
                    ( { model | hosts = EveryDict.insert x.id x hosts }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnVenue response ->
            case response of
                Success x ->
                    ( { model | venues = EveryDict.insert x.id x venues }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnLocation response ->
            case response of
                Success x ->
                    ( { model | locations = EveryDict.insert x.id x locations }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnEvent response ->
            case response of
                Success x ->
                    ( { model | events = EveryDict.insert x.id (GraphCool x) events }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnPool response ->
            case response of
                Success x ->
                    ( { model | pools = EveryDict.insert x.id x pools }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMessage response ->
            case response of
                Success x ->
                    ( { model | messages = EveryDict.insert x.id x messages }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnChat response ->
            case response of
                Success x ->
                    ( { model | chats = EveryDict.insert x.id x chats }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnUser response ->
            case response of
                Success x ->
                    ( { model | users = EveryDict.insert x.id x users }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        -- MAYBE ONE
        ReturnMaybeMe response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | me = Just x }, Cmd.none )

                        Nothing ->
                            -- This is where we prompt the user to create an account
                            -- If the query failed, this means the user likely doesn't exist.
                            -- We create a NEW account here so existing users aren't prompted
                            -- to needlessly create another account.
                            let
                                meForm =
                                    model.forms.meForm

                                modelWithPrefilledDataFromAuth =
                                    case model.auth.state of
                                        Auth0.LoggedIn data ->
                                            { model
                                                | route = GoEditMe
                                                , forms =
                                                    { forms
                                                        | meForm =
                                                            { meForm
                                                                | name = data.profile.given_name
                                                                , email = Just data.profile.email
                                                                , nameFull = Just data.profile.name

                                                                -- , picture =
                                                            }
                                                    }
                                            }

                                        Auth0.LoggedOut ->
                                            { model | route = GoEditMe, errors = "User data wasn't returned?" :: errors }
                            in
                            ( modelWithPrefilledDataFromAuth, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybeHost response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | hosts = EveryDict.insert x.id x hosts }, Cmd.none )

                        Nothing ->
                            ( { model | errors = toString response :: errors }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybeVenue response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | venues = EveryDict.insert x.id x venues }, Cmd.none )

                        Nothing ->
                            ( { model | errors = toString response :: errors }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybeLocation response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | locations = EveryDict.insert x.id x locations }, Cmd.none )

                        Nothing ->
                            ( { model | errors = toString response :: errors }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybeEvent response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | events = EveryDict.insert x.id (GraphCool x) events }, Cmd.none )

                        Nothing ->
                            ( { model | errors = toString response :: errors }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybePool response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            case x.seatGeekId of
                                Nothing ->
                                    ( { model | pools = EveryDict.insert x.id x pools }, Cmd.none )

                                Just eventString ->
                                    case EveryDict.get (Id eventString) events of
                                        Nothing ->
                                            ( { model | pools = EveryDict.insert x.id x pools }, Cmd.none )

                                        Just api ->
                                            ( { model
                                                | pools = EveryDict.insert x.id x pools
                                                , events = EveryDict.insert (Id eventString) api events
                                              }
                                            , Cmd.none
                                            )

                        Nothing ->
                            ( { model | errors = toString response :: errors }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybeMessage response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | messages = EveryDict.insert x.id x messages }, Cmd.none )

                        Nothing ->
                            ( { model | errors = toString response :: errors }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybeChat response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | chats = EveryDict.insert x.id x chats }, Cmd.none )

                        Nothing ->
                            ( { model | errors = toString response :: errors }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybeUser response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | users = EveryDict.insert x.id x users }, Cmd.none )

                        Nothing ->
                            ( { model | errors = toString response :: errors }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybeEmpty response ->
            case response of
                Success _ ->
                    ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        -- SeatGeek
        Types.GetReply reply ->
            case reply of
                Success reply ->
                    let
                        listToDict events =
                            events
                                |> List.map (\event -> ( event.id, SeatGeek event ))
                                |> EveryDict.fromList
                    in
                    ( { model | events = EveryDict.union (listToDict reply.events) events }, Cmd.none )

                Failure e ->
                    ( { model | errors = toString e :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        -- Authentication
        ReturnAuth result ->
            let
                auth =
                    model.auth

                state =
                    model.auth.state

                queryUserIdTokenSelect loggedInUser =
                    Query.selection identity
                        |> with (Query.user (\optionals -> { optionals | auth0UserId = Present loggedInUser.idtoken }) me)

                queryUserIdToken loggedInUser =
                    queryUserIdTokenSelect loggedInUser
                        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
                        |> Graphqelm.Http.send (RemoteData.fromResult >> ReturnMaybeMe)
            in
            case result of
                Ok user ->
                    ( { model | auth = { auth | state = Auth0.LoggedIn user } }, queryUserIdToken user )

                Err err ->
                    ( { model | errors = toString err :: errors }, Cmd.none )



-- Types.AuthenticationMsg authMsg ->
--     let
--         ( authModel, cmd ) =
--             Authentication.update authMsg me.authModel
--         newUser2 =
--             { user2 | id = authModel.getUserId }
--         newUser =
--             { user | user = newUser2 }
--         resultRoute =
--             case authModel.state of
--                 Auth0.LoggedIn _ ->
--                     Types.Chats Nothing
--                 Auth0.LoggedOut ->
--                     Types.Events Nothing
--     in
--     ( { model | me = { me | authModel = authModel, user = newUser }, route = resultRoute }, Cmd.map Types.AuthenticationMsg cmd )
