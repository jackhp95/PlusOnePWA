module Main exposing (main)

-- Try to reomve these?

import Date exposing (..)
import Html exposing (..)
import Mouse
import Pages.CreateEvent.Model as CreateEvent
import Pages.CreateEvent.Update exposing (update)
import Pages.Pool.Model as PoolModel
import Pages.Pool.View exposing (determineTubers, getPosition)
import SeatGeek.Decode
import SeatGeek.Query
import SeatGeek.Types as SG
import Task exposing (..)
import Types exposing (..)
import Update exposing (..)
import View exposing (render)
import WebSocket
import Window exposing (size)
import Auth0.Auth0 as Auth0
import Auth0.Authentication as Authentication
import Pages.User.Model exposing (..)


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


init : Maybe Auth0.LoggedInUser -> ( Model, Cmd Msg )
init initialUser =
    ( (Types.initModel initialUser), initCmd )



-- VIEW --


view : Model -> Html Msg
view model =
    View.render model



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Window.resizes ResizePool, mouseMoveSubs model, auth0authResult (Authentication.handleAuthResult >> AuthenticationMsg) ]


mouseMoveSubs : Model -> Sub Msg
mouseMoveSubs model =
    case model.pool.move of
        Nothing ->
            Sub.none

        Just _ ->
            Sub.batch [ Mouse.moves MouseMove, Mouse.ups MouseEnd ]



-- MAIN --
main : Program (Maybe Auth0.LoggedInUser) Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = Update.update
        , subscriptions = subscriptions
        }
