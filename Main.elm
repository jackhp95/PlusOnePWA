module Main exposing (main)

import View exposing (render)
import Types exposing (..)
import Html exposing (..)
import Update exposing (..)
import WebSocket
import SeatGeek.Query
import SeatGeek.Decode
import SeatGeek.Types as SG
import Mouse
import Window exposing (size)
import Pages.Pool.View exposing (getPosition, determineTubers)

import Pages.CreateEvent.Update exposing (update)
import Pages.CreateEvent.Model as CreateEvent
import Pages.Pool.Model as PoolModel


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
        , update = Update.update
        , subscriptions = subscriptions
        }
