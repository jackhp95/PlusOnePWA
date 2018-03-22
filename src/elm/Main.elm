module Main exposing (main)

import Auth0.Auth0 as Auth0
import Helpers.KissDB as DB exposing (..)
import Html exposing (..)
import Ports
import SeatGeek.Query
import SeatGeek.Types as SG
import Types exposing (..)
import Update exposing (..)
import View exposing (render)


initCmd : Cmd Msg
initCmd =
    Cmd.batch
        [ SeatGeek.Query.askQuery SG.initQuery
        , requestEverything
        ]



-- INIT --


init : Maybe Auth0.LoggedInUser -> ( Model, Cmd Msg )
init initialUser =
    ( Types.emptyModel initialUser, initCmd )



-- VIEW --


view : Model -> Html Msg
view model =
    View.render model



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        handleAuthResult : Auth0.RawAuthenticationResult -> Msg
        handleAuthResult =
            Auth0.mapResult >> ReturnAuth
    in
    Sub.batch
        [ Ports.auth0authResult handleAuthResult ]



-- MAIN --


main : Program (Maybe Auth0.LoggedInUser) Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = Update.update
        , subscriptions = subscriptions
        }
