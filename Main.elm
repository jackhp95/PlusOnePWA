module Main exposing (main)

import View exposing (render)
import Types exposing (..)
import Html exposing (..)
import WebSocket
import SeatGeek.Query
import SeatGeek.Decode
import SeatGeek.Types as SG
import Mouse
import Window exposing (size)
import Pages.Pool exposing (getPosition, determineTubers)

import Pages.CreateEvent.Update exposing (update)
import Pages.CreateEvent.Model as CreateEvent


-- Try to reomve these?

import Date exposing (..)
import Task exposing (..)


initCmd : Cmd Msg
initCmd =
    Cmd.batch
        [ SeatGeek.Query.askQuery SG.initQuery
        , getDatetime
        , initWindow
        ]


initWindow : Cmd Msg
initWindow =
    Task.perform InitialWindow Window.size


getDatetime : Cmd Msg
getDatetime =
    Date.now
        |> Task.perform OnDatetime



-- INIT --


init : ( Model, Cmd Msg )
init =
    ( initModel, initCmd )



-- VIEW --


view : Model -> Html Msg
view model =
    View.render model



-- UPDATE --


update : Msg -> Model -> ( Model, Cmd Msg )
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
            ChangeTo newRoute ->
                ( { model | route = newRoute }, Cmd.none )
            CreateEventMsg createEventMsg ->
                let
                    ( createEventModel, createEventCmd ) =
                        Pages.CreateEvent.Update.update createEventMsg model.createEvent
                in
                    ( { model | createEvent = createEventModel }
                    , Cmd.map CreateEventMsg createEventCmd
                    )
            Input newInput ->
                ( model, Cmd.none )

            -- ( { model | input = newInput }, Cmd.none )
            SendChatMessage ->
                ( model, Cmd.none )

            -- ( { model | input = "" }, WebSocket.send echoServer model.input )
            NewMessage str ->
                ( model, Cmd.none )

            ViewChat chat ->
                ( { model
                    | route = chat
                  }
                , Cmd.none
                )

            -- EVENTS
            ViewEvent event ->
                ( { model
                    | route = event
                  }
                , Cmd.none
                )

            OnDatetime now ->
                ( { model
                    | events =
                        { events
                            | currentDatetime = Just now
                        }
                  }
                , Cmd.none
                )

            -- SeatGeek
            GetReply (Ok recieved) ->
                ( { model
                    | events =
                        { events
                            | seatgeek = Just (SG.Reply recieved.meta recieved.events)
                        }
                  }
                , Cmd.none
                )

            -- ChatBox Updates
            TextAreaResizer height ->
                ( { model
                    | client =
                        { client
                            | textAreaHeight = height
                        }
                  }
                , Cmd.none
                )

            -- POOL
            MouseStart xy ->
                ( { model
                    | pool =
                        { pool
                            | move = (Just (Move xy xy))
                        }
                  }
                , Cmd.none
                )

            MouseMove xy ->
                ( { model
                    | pool =
                        { pool
                            | move = (Maybe.map (\{ start } -> Move start xy) pool.move)
                        }
                  }
                , Cmd.none
                )

            MouseEnd _ ->
                ( { model
                    | pool =
                        { pool
                            | position = (getPosition pool)
                            , move = Nothing
                        }
                  }
                , Cmd.none
                )

            ResizePool windowSize ->
                ( { model
                    | pool =
                        { pool
                            | windowSize = windowSize
                            , tubers = (determineTubers pool windowSize)
                        }
                  }
                , Cmd.none
                )

            InitialWindow windowSize ->
                ( { model
                    | pool =
                        { pool
                            | windowSize = windowSize
                            , tubers = (determineTubers pool windowSize)
                        }
                  }
                , Cmd.none
                )

            -- Discover ->
            --     ( model, SeatGeek.askQuery SG.initQuery )
            GetReply (Err e) ->
                let
                    _ =
                        Debug.log "err" e
                in
                    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Window.resizes ResizePool, mouseMoveSubs model ]


mouseMoveSubs : Model -> Sub Msg
mouseMoveSubs model =
    case model.pool.move of
        Nothing ->
            Sub.none

        Just _ ->
            Sub.batch [ Mouse.moves MouseMove, Mouse.ups MouseEnd ]



-- MAIN --


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
