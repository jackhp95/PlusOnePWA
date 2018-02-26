module Update exposing (..)

import Pages.Chat.Update exposing (..)
import Pages.CreateEvent.Messages as CreateEventMessages
import Pages.CreateEvent.Update exposing (..)
import Pages.Pool.Model as PoolModel
import Pages.Pool.View exposing (determineTubers, getPosition)
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
    in
    case msg of
        Types.ChangeTo newRoute ->
            ( { model | route = newRoute }, Cmd.none )

        Types.CreateEventMsg createEventMsg ->
            let
                ( createEventModel, createEventCmd ) =
                    Pages.CreateEvent.Update.update createEventMsg model.createEvent
            in
            ( { model | createEvent = createEventModel }
            , Cmd.map Types.CreateEventMsg createEventCmd
            )

        Types.UserMsg userMsg ->
            let
                ( userModel, userCmd ) =
                    Pages.User.Update.update userMsg model.user
            in
            ( { model | user = userModel }
            , Cmd.map Types.UserMsg userCmd
            )

        Types.ChatMsg chatMsg ->
            let
                ( chatModel, chatCmd ) =
                    Pages.Chat.Update.update chatMsg model.chat
            in
            ( { model | chat = chatModel }
            , Cmd.map Types.ChatMsg chatCmd
            )

        Types.Input newInput ->
            ( model, Cmd.none )

        -- ( { model | input = "" }, WebSocket.send echoServer model.input )
        Types.NewMessage str ->
            ( model, Cmd.none )

        Types.ViewChat chat ->
            ( { model
                | route = chat
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
