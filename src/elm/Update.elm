module Update exposing (..)

import EveryDict exposing (..)
import EveryDictFrom exposing (..)
import GraphCool.InputObject exposing (..)
import GraphCool.Mutation as Mutation exposing (..)
import GraphCool.Scalar exposing (..)
import Graphqelm.Http exposing (..)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present), fromMaybe)
import Graphqelm.SelectionSet as SelectionSet exposing (SelectionSet, with)
import KissDB as DB exposing (..)
import RemoteData exposing (..)
import Types exposing (..)


-- UPDATE --


update : Types.Msg -> Types.Model -> ( Types.Model, Cmd Types.Msg )
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

        me =
            model.me

        errors =
            model.errors
    in
    case msg of
        RouteTo newRoute ->
            let
                basicRoute =
                    ( { model | route = newRoute }, Cmd.none )
            in
            case newRoute of
                GoEvents maybe ->
                    case maybe of
                        Nothing ->
                            basicRoute

                        Just eventId ->
                            basicRoute

                --     Types.GoAuth ->
                --         case me of
                --             Nothing ->
                --                 ( model, Cmd.map Types.AuthenticationMsg (model.me.authModel.authorize {}) )
                --             Just x ->
                --                 ( { model | me = Nothing }, Cmd.map Types.AuthenticationMsg (model.me.authModel.logOut ()) )
                _ ->
                    basicRoute

        -- ( { model | route = newRoute }
        -- , Nav.newUrl newRoute)
        --)
        UpdateValue input ->
            let
                forms =
                    model.forms

                event =
                    forms.event

                me =
                    forms.me
            in
            case input of
                -- Me
                MeName val ->
                    ( { model | forms = { forms | me = { me | name = val } } }, Cmd.none )

                MeNameFull val ->
                    ( { model | forms = { forms | me = { me | nameFull = Just val } } }, Cmd.none )

                MeBio val ->
                    ( { model | forms = { forms | me = { me | bio = Just val } } }, Cmd.none )

                MeBirthday val ->
                    ( { model | forms = { forms | me = { me | birthday = DateTime val } } }, Cmd.none )

                MeSubmit ->
                    ( model, Cmd.none )

                -- Message
                MessageText id val ->
                    case val == "" of
                        False ->
                            ( { model | messages = EveryDict.insert id { initMessage | text = val } model.messages }, Cmd.none )

                        True ->
                            ( { model | messages = EveryDict.remove id model.messages }, Cmd.none )

                MessageSend id ->
                    ( { model | messages = EveryDict.remove id model.messages }, Cmd.none )

                -- Event
                EventName val ->
                    ( { model | forms = { forms | event = { event | name = val } } }, Cmd.none )

                EventNameFull val ->
                    ( { model | forms = { forms | event = { event | nameFull = Just val } } }, Cmd.none )

                EventStartDate val ->
                    ( { model | forms = { forms | event = { event | startsAt = DateTime val } } }, Cmd.none )

                EventEndDate val ->
                    ( { model | forms = { forms | event = { event | endsAt = Just <| DateTime val } } }, Cmd.none )

                EventSubmit ->
                    let
                        composeEvent =
                            Mutation.selection identity
                                |> with
                                    (Mutation.createEvent
                                        (\eventOptionals ->
                                            { eventOptionals
                                                | endsAt = fromMaybe event.endsAt
                                                , nameFull = fromMaybe event.nameFull
                                                , private = Present event.private
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
                                        { name = event.name, startsAt = event.startsAt }
                                        DB.event
                                    )

                        sendCreateEventRequest =
                            composeEvent
                                |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
                                |> Graphqelm.Http.send
                                    (RemoteData.fromResult >> ReturnMaybeEvent)
                    in
                    ( { model | forms = { forms | event = initEvent } }, sendCreateEventRequest )

        -- Everything
        ReturnEverything response ->
            case response of
                Success x ->
                    ( { model
                        | hosts = EveryDict.union (EveryDictFrom.listHost x.hosts) model.hosts
                        , venues = EveryDict.union (EveryDictFrom.listVenue x.venues) model.venues
                        , locations = EveryDict.union (EveryDictFrom.listLocation x.locations) model.locations
                        , events = EveryDict.union (x.events |> List.map (\event -> ( event.id, GraphCool event )) |> EveryDict.fromList) model.events
                        , pools = EveryDict.union (EveryDictFrom.listPool x.pools) model.pools
                        , messages = EveryDict.union (EveryDictFrom.listMessage x.messages) model.messages
                        , chats = EveryDict.union (EveryDictFrom.listChat x.chats) model.chats
                        , users = EveryDict.union (EveryDictFrom.listUser x.users) model.users
                        , me = x.me
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
                    ( { model | hosts = EveryDict.union (EveryDictFrom.listHost x) hosts }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnVenues response ->
            case response of
                Success x ->
                    ( { model | venues = EveryDict.union (EveryDictFrom.listVenue x) venues }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnLocations response ->
            case response of
                Success x ->
                    ( { model | locations = EveryDict.union (EveryDictFrom.listLocation x) locations }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnEvents response ->
            case response of
                Success x ->
                    ( { model | events = EveryDict.union (EveryDictFrom.listEvent x) events }, Cmd.none )

                -- API of GraphCool is hardcoded into listEvent
                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnPools response ->
            case response of
                Success x ->
                    ( { model | pools = EveryDict.union (EveryDictFrom.listPool x) pools }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMessages response ->
            case response of
                Success x ->
                    ( { model | messages = EveryDict.union (EveryDictFrom.listMessage x) messages }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnChats response ->
            case response of
                Success x ->
                    ( { model | chats = EveryDict.union (EveryDictFrom.listChat x) chats }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnUsers response ->
            case response of
                Success x ->
                    ( { model | users = EveryDict.union (EveryDictFrom.listUser x) users }, Cmd.none )

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
                            ( { model | me = Nothing }, Cmd.none )

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
                            ( model, Cmd.none )

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
                            ( model, Cmd.none )

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
                            ( model, Cmd.none )

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
                            ( model, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMaybePool response ->
            case response of
                Success maybe ->
                    case maybe of
                        Just x ->
                            ( { model | pools = EveryDict.insert x.id x pools }, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

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
                            ( model, Cmd.none )

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
                            ( model, Cmd.none )

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
