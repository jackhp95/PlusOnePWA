module Update exposing (..)

-- import Auth0.Auth0 as Auth0
-- import GraphCool.Scalar exposing (..)

import Auth0.Authentication as Authentication
import Debug exposing (log)
import GraphCool.Scalar exposing (..)
import Pages.Chat.Update exposing (..)
import Pages.Chats.Update exposing (..)
import Pages.CreateEvent.Update exposing (..)
import Pages.CreateMessage.Messages as CreateMessageMsg
import Pages.CreateMessage.Update exposing (makeSendRequest)
import Pages.EditUser.Messages as EditUserMsg
import Pages.EditUser.Update exposing (..)
import Pages.Events.Update
import Pages.Pool.Model as PoolModel
import Pages.Pool.View exposing (determineTubers, getPosition)
import Pages.User.Model exposing (..)
import Pages.User.Update exposing (..)
import SeatGeek.Types as SG
import Types


-- UPDATE --


update : Types.Msg -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    let
        events =
            model.events

        client =
            model.client

        pool =
            model.pool

        me =
            model.me

        user =
            model.me.user

        user2 =
            model.me.user.user
    in
    case msg of
        Types.AuthenticationMsg authMsg ->
            let
                ( authModel, cmd ) =
                    Authentication.update authMsg model.me.authModel

                newUser2 =
                    { user2 | id = authModel.getUserId }

                newUser =
                    { user | user = newUser2 }

                resultRoute =
                    case authModel.getUserId of
                        Id "0" ->
                            Types.GoChats Nothing

                        Id "1" ->
                            Types.GoChats Nothing

                        Id "2" ->
                            Types.GoChats Nothing

                        Id "3" ->
                            Types.GoEditUser

                        _ ->
                            Types.GoCreateEvent
            in
            ( { model | me = { me | authModel = authModel, user = newUser }, route = resultRoute }, Cmd.map Types.AuthenticationMsg cmd )

        Types.ChangeTo newRoute ->
            ( { model | route = newRoute }, Cmd.none )

        Types.ChatsMsg chatsMsg ->
            let
                ( chatsModel, chatsCmd ) =
                    Pages.Chats.Update.update chatsMsg model.chats me
            in
            ( { model | chats = chatsModel }
            , Cmd.map Types.ChatsMsg chatsCmd
            )

        Types.CreateEventMsg createEventMsg ->
            let
                ( createEventModel, createEventCmd ) =
                    Pages.CreateEvent.Update.update createEventMsg model.createEvent
            in
            ( { model | createEvent = createEventModel }
            , Cmd.map Types.CreateEventMsg createEventCmd
            )

        Types.UpdateTextInput text ->
            let
                ( createMessageModel, createMessageCmd ) =
                    Pages.CreateMessage.Update.update (CreateMessageMsg.ChangeText text) model.createMessage
            in
            ( { model | createMessage = createMessageModel }
            , Cmd.none
            )

        Types.CreateMessageMsg createMessageMsg ->
            let
                ( createMsgModel, createMessageCmd ) =
                    Pages.CreateMessage.Update.update createMessageMsg model.createMessage
            in
            ( { model | createMessage = createMsgModel }
            , Cmd.map Types.CreateMessageMsg createMessageCmd
            )

        Types.EditUserMsg userMsg ->
            let
                ( userModel, userCmd ) =
                    Pages.EditUser.Update.update userMsg me.user me
            in
            ( { model | me = { me | user = userModel } }
            , Cmd.map Types.EditUserMsg userCmd
            )

        Types.EventsMsg eventsMsg ->
            let
                ( eventsModel, eventsCmd ) =
                    Pages.Events.Update.update eventsMsg model.events me
            in
            ( { model | events = eventsModel }
            , Cmd.map Types.EventsMsg eventsCmd
            )

        Types.UserMsg userMsg ->
            let
                ( userModel, userCmd ) =
                    Pages.User.Update.update userMsg me.user
            in
            ( { model | me = { me | user = userModel } }
            , Cmd.map Types.UserMsg userCmd
            )

        Types.ChatMsg chatMsg ->
            let
                ( chatModel, chatCmd ) =
                    Pages.Chat.Update.update chatMsg model.chat me
            in
            ( { model | chat = chatModel }
            , Cmd.map Types.ChatMsg chatCmd
            )

        Types.Input newInput ->
            ( model, Cmd.none )

        -- ( { model | input = "" }, WebSocket.send echoServer model.input )
        Types.NewMessage str ->
            ( model, Cmd.none )

        Types.ViewChat newRoute ->
            let
                newChat =
                    case newRoute of
                        Types.GoChats maybeChat ->
                            case maybeChat of
                                Nothing ->
                                    model.chat

                                Just c ->
                                    c

                        _ ->
                            model.chat

                oldCM =
                    model.createMessage

                newCM =
                    { oldCM | chatId = newChat.id }
            in
            ( { model
                | route = newRoute
                , chat = newChat
                , createMessage = newCM
              }
            , Cmd.none
            )

        -- EVENTS
        Types.ViewEvent event ->
            ( { model
                | route = event
              }
            , Cmd.none
            )

        Types.OnDatetime now ->
            ( { model
                | events =
                    { events
                        | currentDatetime = Just now
                    }
              }
            , Cmd.none
            )

        -- SeatGeek
        Types.GetReply (Ok recieved) ->
            ( { model
                | events =
                    { events
                        | seatgeek = Just (SG.Reply recieved.meta recieved.events)
                    }
              }
            , Cmd.none
            )

        -- ChatBox Updates
        Types.TextAreaResizer height ->
            ( { model
                | client =
                    { client
                        | textAreaHeight = height
                    }
              }
            , Cmd.none
            )

        -- POOL
        Types.MouseStart xy ->
            ( { model
                | pool =
                    { pool
                        | move = Just (PoolModel.Move xy xy)
                    }
              }
            , Cmd.none
            )

        Types.MouseMove xy ->
            ( { model
                | pool =
                    { pool
                        | move = Maybe.map (\{ start } -> PoolModel.Move start xy) pool.move
                    }
              }
            , Cmd.none
            )

        Types.MouseEnd _ ->
            ( { model
                | pool =
                    { pool
                        | position = getPosition pool
                        , move = Nothing
                    }
              }
            , Cmd.none
            )

        Types.ResizePool windowSize ->
            ( { model
                | pool =
                    { pool
                        | windowSize = windowSize
                        , tubers = determineTubers pool windowSize
                    }
              }
            , Cmd.none
            )

        Types.InitialWindow windowSize ->
            ( { model
                | pool =
                    { pool
                        | windowSize = windowSize
                        , tubers = determineTubers pool windowSize
                    }
              }
            , Cmd.none
            )

        -- Discover ->
        --     ( model, SeatGeek.askQuery SG.initQuery )
        Types.GetReply (Err e) ->
            let
                _ =
                    Debug.log "err" e
            in
            ( model, Cmd.none )