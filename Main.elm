module Main exposing (main)

import View exposing (render)
import Types exposing (..)
import Html exposing (..)
import WebSocket
import SeatGeek
import SeatGeekTypes as SG


-- Try to reomve these?

import Date exposing (..)
import Task exposing (..)


echoServer : String
echoServer =
    "wss://echo.websocket.org"


initCmd : Cmd Msg
initCmd =
    Cmd.batch [ SeatGeek.askQuery SG.initQuery, getDatetime ]


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


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    let
        events =
            model.events

        client =
            model.client
    in
        case msg of
            ChangeTo newRoute ->
                ( { model | route = newRoute }, Cmd.none )

            Input newInput ->
                ( model, Cmd.none )

            -- ( { model | input = newInput }, Cmd.none )
            SendChatMessage ->
                ( model, Cmd.none )

            -- ( { model | input = "" }, WebSocket.send echoServer model.input )
            NewMessage str ->
                ( model, Cmd.none )

            -- EVENTS
            ViewEvent (Just id) ->
                ( { model
                    | events =
                        { events | selectedEvent = Just id }
                  }
                , Cmd.none
                )

            ViewEvent Nothing ->
                ( { model
                    | events =
                        { events
                            | selectedEvent = Nothing
                        }
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
                            | seatgeek = (SG.Reply recieved.meta (events.seatgeek.events ++ recieved.events))
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

            -- Discover ->
            --     ( model, SeatGeek.askQuery SG.initQuery )
            GetReply (Err e) ->
                let
                    _ =
                        Debug.log "err" e
                in
                    ( model, Cmd.none )



-- ( { model | messages = (str :: model.messages) }, Cmd.none )
-- Subscriptions --


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN --


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
