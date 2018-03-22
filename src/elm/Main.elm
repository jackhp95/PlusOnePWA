module Main exposing (main)

-- Try to reomve these?
-- Try to reomve these?
-- import Date exposing (..)
-- import Navigation exposing (..)
-- import Pages.CreateEvent.Messages as CreateEventMsg
-- import Pages.CreateEvent.Model as CreateEvent
-- import Pages.CreateEvent.Update exposing (update)
-- -- import Pages.Pool.Model as PoolModel
-- import Pages.Pool.View exposing (determineTubers, getPosition)
-- import SeatGeek.Decode
-- import WebSocket
-- import Pages.User.Model exposing (..)
-- import Pages.Chats.Update as ChatsUpdate exposing (makeQueryRequest)
-- import Pages.Events.Update as EventsUpdate exposing (makeQueryRequest)
-- import SeatGeek.Query
-- import Auth0.Authentication as Authentication
-- import Mouse
-- import Task exposing (..)

import Auth0.Auth0 as Auth0
import Auth0.Authentication as Authentication
import Html exposing (..)
import KissDB as DB exposing (..)
import SeatGeek.Query
import SeatGeek.Types as SG
import Types exposing (..)
import Update exposing (..)
import View exposing (render)
import Ports


-- import Window exposing (size)


initCmd : Cmd Msg
initCmd =
    Cmd.batch
        [ SeatGeek.Query.askQuery SG.initQuery

        -- , getDatetime
        -- , initWindow
        , DB.requestEvents identity
        , DB.requestChats identity
        , DB.requestUsers identity
        , DB.requestPools identity
        , DB.requestMessages identity

        -- , initEventsQuery
        -- , initChatsQuery
        ]



-- initEventsQuery : Cmd Msg
-- initEventsQuery =
--     Cmd.map Types.EventsMsg EventsUpdate.makeQueryRequest
-- initChatsQuery : Cmd Msg
-- initChatsQuery =
--     Cmd.map Types.ChatsMsg ChatsUpdate.makeQueryRequest
-- initWindow : Cmd Msg
-- initWindow =
--     Task.perform InitialWindow Window.size
-- getDatetime : Cmd Msg
-- getDatetime =
--     Date.now
--         |> Task.perform OnDatetime
-- INIT --
-- Maybe Auth0.LoggedInUser ->


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
    Sub.batch
    [ {--Window.resizes ResizePool, mouseMoveSubs model,--}
      Ports.auth0authResult (Authentication.handleAuthResult >> AuthenticationMsg)
    ]
-- mouseMoveSubs : Model -> Sub Msg
-- mouseMoveSubs model =
--     case model.pool.move of
--         Nothing ->
--             Sub.none
--         Just _ ->
--             Sub.batch [ Mouse.moves MouseMove, Mouse.ups MouseEnd ]
-- MAIN --
-- (Maybe Auth0.LoggedInUser)


main : Program (Maybe Auth0.LoggedInUser) Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = Update.update
        , subscriptions = subscriptions
        }
