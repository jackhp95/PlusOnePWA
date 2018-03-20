module Main exposing (main)

import Auth0.Auth0 as Auth0
import Helpers.KissDB as DB exposing (..)
import Html exposing (..)
import SeatGeek.Query
import SeatGeek.Types as SG
import Types exposing (..)
import Update exposing (..)
import View exposing (render)


-- import Window exposing (size)


initCmd : Cmd Msg
initCmd =
    Cmd.batch
        [ SeatGeek.Query.askQuery SG.initQuery
        , requestEverything
        ]



-- INIT --
-- Maybe Auth0.LoggedInUser ->


init : ( Model, Cmd Msg )
init =
    ( Types.emptyModel, initCmd )



-- VIEW --


view : Model -> Html Msg
view model =
    View.render model



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Sub.batch
--     [ {--Window.resizes ResizePool, mouseMoveSubs model,--}
--       auth0authResult (Authentication.handleAuthResult >> AuthenticationMsg)
--     ]
-- MAIN --
-- (Maybe Auth0.LoggedInUser)


main : Program Never Model Msg
main =
    Html.program
        -- WithFlags
        { init = init
        , view = view
        , update = Update.update
        , subscriptions = subscriptions
        }
