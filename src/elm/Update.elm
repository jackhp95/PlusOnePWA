module Update exposing (..)

-- import Pages.EditUser.Messages as EditUserMsg
-- -- import Pages.User.Model exposing (..)
-- import Pages.EditUser.Messages as EditUserMsg
-- import Pages.Pool.View exposing (determineTubers, getPosition)
-- import Pages.Chat.Update exposing (..)
-- import Pages.Chats.Messages as ChatsMsg
-- import Pages.Chats.Update exposing (..)
-- import Pages.CreateChat.Messages as CreateChatMsg
-- import Pages.CreateChat.Update
-- import Pages.CreateEvent.Update exposing (..)
-- import Pages.CreateMessage.Messages as CreateMessageMsg
-- import Pages.CreateMessage.Update exposing (makeSendRequest)
-- import Pages.EditUser.Update exposing (..)
-- import Pages.Event.Messages as EventMsg
-- import Pages.Event.Update
-- import Pages.Events.Model exposing (EventAPI(GraphCool, SeatGeek))
-- import Pages.Events.Update
-- import Pages.Pool.Model as PoolModel
-- import Pages.User.Model exposing (..)
-- import Pages.User.Update exposing (..)
-- import Auth0.Auth0 as Auth0
-- import Auth0.Authentication as Authentication
-- import SeatGeek.Types as SG
-- import Debug exposing (log)
-- import Navigation as Nav
-- ---------------------------- --
-- PRE FUNCTIONAL IMPORTS ABOVE --
-- ---------------------------- --
-- import GraphCool.Enum.DateState exposing (DateState)
-- import GraphCool.Object.Chat as Chat
-- import GraphCool.Object.Event as Event
-- import GraphCool.Object.Host as Host
-- import GraphCool.Object.Location as Location
-- import GraphCool.Object.Message as Message
-- import GraphCool.Object.Pool as Pool
-- import GraphCool.Object.User as User
-- import GraphCool.Object.Venue as Venue
-- import GraphCool.Query as Query
-- import Graphqelm.Document as Document
-- import Graphqelm.Operation exposing (RootQuery)
-- import GraphCool.InputObject as IO exposing (..)

import Dict exposing (..)
import DictFrom exposing (..)
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
        -- , Nav.newUrl (toString newRoute)
        -- )
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
                            ( { model | messages = Dict.insert (toString id) { initMessage | text = val } model.messages }, Cmd.none )

                        True ->
                            ( { model | messages = Dict.remove (toString id) model.messages }, Cmd.none )

                MessageSend id ->
                    ( { model | messages = Dict.remove (toString id) model.messages }, Cmd.none )

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

        -- MANY
        ReturnHosts response ->
            case response of
                Success x ->
                    ( { model | hosts = Dict.union (DictFrom.listHost x) hosts }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnVenues response ->
            case response of
                Success x ->
                    ( { model | venues = Dict.union (DictFrom.listVenue x) venues }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnLocations response ->
            case response of
                Success x ->
                    ( { model | locations = Dict.union (DictFrom.listLocation x) locations }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnEvents response ->
            case response of
                Success x ->
                    ( { model | events = Dict.union (DictFrom.listEvent x) events }, Cmd.none )

                -- API of GraphCool is hardcoded into listEvent
                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnPools response ->
            case response of
                Success x ->
                    ( { model | pools = Dict.union (DictFrom.listPool x) pools }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMessages response ->
            case response of
                Success x ->
                    ( { model | messages = Dict.union (DictFrom.listMessage x) messages }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnChats response ->
            case response of
                Success x ->
                    ( { model | chats = Dict.union (DictFrom.listChat x) chats }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnUsers response ->
            case response of
                Success x ->
                    ( { model | users = Dict.union (DictFrom.listUser x) users }, Cmd.none )

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
                    ( { model | hosts = Dict.insert (toString x.id) x hosts }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnVenue response ->
            case response of
                Success x ->
                    ( { model | venues = Dict.insert (toString x.id) x venues }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnLocation response ->
            case response of
                Success x ->
                    ( { model | locations = Dict.insert (toString x.id) x locations }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnEvent response ->
            case response of
                Success x ->
                    ( { model | events = Dict.insert (toString x.id) (GraphCool x) events }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnPool response ->
            case response of
                Success x ->
                    ( { model | pools = Dict.insert (toString x.id) x pools }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnMessage response ->
            case response of
                Success x ->
                    ( { model | messages = Dict.insert (toString x.id) x messages }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnChat response ->
            case response of
                Success x ->
                    ( { model | chats = Dict.insert (toString x.id) x chats }, Cmd.none )

                Failure y ->
                    ( { model | errors = toString y :: errors }, Cmd.none )

                _ ->
                    ( { model | errors = "RemoteData is running an update?" :: errors }, Cmd.none )

        ReturnUser response ->
            case response of
                Success x ->
                    ( { model | users = Dict.insert (toString x.id) x users }, Cmd.none )

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
                            ( { model | hosts = Dict.insert (toString x.id) x hosts }, Cmd.none )

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
                            ( { model | venues = Dict.insert (toString x.id) x venues }, Cmd.none )

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
                            ( { model | locations = Dict.insert (toString x.id) x locations }, Cmd.none )

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
                            ( { model | events = Dict.insert (toString x.id) (GraphCool x) events }, Cmd.none )

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
                            ( { model | pools = Dict.insert (toString x.id) x pools }, Cmd.none )

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
                            ( { model | messages = Dict.insert (toString x.id) x messages }, Cmd.none )

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
                            ( { model | chats = Dict.insert (toString x.id) x chats }, Cmd.none )

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
                            ( { model | users = Dict.insert (toString x.id) x users }, Cmd.none )

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
                                |> List.map (\event -> ( toString event.id, SeatGeek event ))
                                |> Dict.fromList
                    in
                    ( { model | events = Dict.union (listToDict reply.events) events }, Cmd.none )

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
-- Types.ChatsMsg chatsMsg ->
--     let
--         ( chatsModel, chatsCmd ) =
--             Pages.Chats.Update.update chatsMsg chats me
--     in
--     ( { model | chats = chatsModel }
--     , Cmd.map Types.ChatsMsg chatsCmd
--     )
-- Types.CreateEventMsg createEventMsg ->
--     let
--         ( createEventModel, createEventCmd ) =
--             Pages.CreateEvent.Update.update createEventMsg model.createEvent
--     in
--     ( { model | createEvent = createEventModel }
--     , Cmd.map Types.CreateEventMsg createEventCmd
--     )
-- Types.UpdateTextInput text ->
--     let
--         ( createMessageModel, createMessageCmd ) =
--             Pages.CreateMessage.Update.update (CreateMessageMsg.ChangeText text) model.createMessage
--     in
--     ( { model | createMessage = createMessageModel }
--     , Cmd.none
--     )
-- Types.CreateMessageMsg createMessageMsg ->
--     let
--         ( createMsgModel, createMessageCmd ) =
--             Pages.CreateMessage.Update.update createMessageMsg model.createMessage
--     in
--     ( { model | createMessage = createMsgModel }
--     , Cmd.map Types.CreateMessageMsg createMessageCmd
--     )
-- Types.CreateChatMsg createChatMsg ->
--     let
--         ( createChatModel, createChatCmd ) =
--             Pages.CreateChat.Update.update createChatMsg model.createChat
--     in
--     ( { model | createChat = createChatModel }
--     , Cmd.map Types.CreateChatMsg createChatCmd
--     )
-- Types.UpdateChats newChatsRoute newChat ->
--     { model
--         | route = newChatsRoute
--         , createChat = newChat
--     }
--         |> update (Types.CreateChatMsg CreateChatMsg.MutateCreateChat)
-- Types.EditUserMsg userMsg ->
--     let
--         ( userModel, userCmd ) =
--             Pages.EditUser.Update.update userMsg me.user me
--     in
--     ( { model | me = { me | user = userModel } }
--     , Cmd.map Types.EditUserMsg userCmd
--     )
-- Types.EventsMsg eventsMsg ->
--     let
--         ( eventsModel, eventsCmd ) =
--             Pages.Events.Update.update eventsMsg model.events me
--     in
--     ( { model | events = eventsModel }
--     , Cmd.map Types.EventsMsg eventsCmd
--     )
-- Types.UserMsg userMsg ->
--     let
--         ( userModel, userCmd ) =
--             Pages.User.Update.update userMsg me.user
--     in
--     ( { model | me = { me | user = userModel } }
--     , Cmd.map Types.UserMsg userCmd
--     )
-- Types.ChatMsg chatMsg ->
--     let
--         ( chatModel, chatCmd ) =
--             Pages.Chat.Update.update chatMsg model.chat me
--     in
--     ( { model | chat = chatModel }
--     , Cmd.map Types.ChatMsg chatCmd
--     )
-- Types.Input newInput ->
--     ( model, Cmd.none )
-- -- ( { model | input = "" }, WebSocket.send echoServer model.input )
-- Types.NewMessage str ->
--     ( model, Cmd.none )
-- Types.ViewChat newRoute ->
--     let
--         newChat =
--             case newRoute of
--                 Types.Chats maybeChat ->
--                     case maybeChat of
--                         Nothing ->
--                             model.chat
--                         Just c ->
--                             c
--                 _ ->
--                     model.chat
--         oldCM =
--             model.createMessage
--         newCM =
--             { oldCM | chatId = newChat.id }
--     in
--     ( { model
--         | route = newRoute
--         , chat = newChat
--         , createMessage = newCM
--       }
--     , Cmd.none
--     )
-- -- EVENTS
-- Types.ViewEvent newEventRoute ->
--     let
--         toPool =
--             case newEventRoute of
--                 Types.Events maybeEvent ->
--                     case maybeEvent of
--                         Nothing ->
--                             model.pool
--                         Just eventAPI ->
--                             case eventAPI of
--                                 SeatGeek sgEvent ->
--                                     model.pool
--                                 GraphCool event ->
--                                     let
--                                         poolModel = model.pool
--                                     in
--                                         { poolModel | pool = event.pool}
--                 _ ->
--                     model.pool
--     in
--     ( { model
--         | route = newEventRoute
--         , pool = toPool
--       }
--     , Cmd.none
--     )
-- Types.ViewPool newPoolRoute ->
--         { model | route = newPoolRoute }
--             |> update (Types.EventPoolMsg EventMsg.AddToPool)
-- Types.EventPoolMsg eventMsg ->
--     let
--         ( updatedPool, updatePoolCmd ) =
--             Pages.Event.Update.update eventMsg model.pool me
--     in
--     ( { model | pool = updatedPool }
--     , Cmd.map Types.EventPoolMsg updatePoolCmd
--     )
-- -- ChatBox Updates
-- Types.TextAreaResizer height ->
--     ( { model
--         | client =
--             { client
--                 | textAreaHeight = height
--             }
--       }
--     , Cmd.none
--     )
-- -- POOL
-- Types.MouseStart xy ->
--     ( { model
--         | pool =
--             { pool
--                 | move = Just (PoolModel.Move xy xy)
--             }
--       }
--     , Cmd.none
--     )
-- Types.MouseMove xy ->
--     ( { model
--         | pool =
--             { pool
--                 | move = Maybe.map (\{ start } -> PoolModel.Move start xy) pool.move
--             }
--       }
--     , Cmd.none
--     )
-- Types.MouseEnd _ ->
--     ( { model
--         | pool =
--             { pool
--                 | position = getPosition pool
--                 , move = Nothing
--             }
--       }
--     , Cmd.none
--     )
-- Types.ResizePool windowSize ->
--     ( { model
--         | pool =
--             { pool
--                 | windowSize = windowSize
--                 , tubers = determineTubers pool windowSize
--             }
--       }
--     , Cmd.none
--     )
-- Types.InitialWindow windowSize ->
--     ( { model
--         | pool =
--             { pool
--                 | windowSize = windowSize
--                 , tubers = determineTubers pool windowSize
--             }
--       }
--     , Cmd.none
--     )
-- Discover ->
--     ( model, SeatGeek.askQuery SG.initQuery )
