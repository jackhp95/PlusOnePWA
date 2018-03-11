module Main exposing (main)

-- Try to reomve these?
-- Try to reomve these?

import Auth0.Auth0 as Auth0
import Auth0.Authentication as Authentication
import Date exposing (..)
import Html exposing (..)
import Mouse
import Pages.Chats.Update as ChatsUpdate exposing (makeQueryRequest)
import Pages.CreateEvent.Messages as CreateEventMsg
import Pages.CreateEvent.Model as CreateEvent
import Pages.CreateEvent.Update exposing (update)
import Pages.Events.Update as EventsUpdate exposing (makeQueryRequest)
import Pages.Pool.Model as PoolModel
-- import Pages.Pool.View exposing (determineTubers, getPosition)
import Pages.User.Model exposing (..)
import SeatGeek.Decode
import SeatGeek.Query
import SeatGeek.Types as SG
import Task exposing (..)
import Types exposing (..)
import Update exposing (..)
import View exposing (render)
import WebSocket
import Window exposing (size)


initCmd : Cmd Msg
initCmd =
    Cmd.batch
        [ SeatGeek.Query.askQuery SG.initQuery
        , getDatetime
        -- , initWindow
        , initEventsQuery
        , initChatsQuery 
        ]


initEventsQuery : Cmd Msg
initEventsQuery =
    Cmd.map Types.EventsMsg EventsUpdate.makeQueryRequest

initChatsQuery : Cmd Msg
initChatsQuery = 
    Cmd.map Types.ChatsMsg ChatsUpdate.makeQueryRequest 

-- initWindow : Cmd Msg
-- initWindow =
--     Task.perform InitialWindow Window.size


getDatetime : Cmd Msg
getDatetime =
    Date.now
        |> Task.perform OnDatetime



-- INIT --


init : Maybe Auth0.LoggedInUser -> ( Model, Cmd Msg )
init initialUser =
    ( Types.initModel initialUser, initCmd )



-- VIEW --


view : Model -> Html Msg
view model =
    View.render model



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ {--Window.resizes ResizePool, mouseMoveSubs model,--} auth0authResult (Authentication.handleAuthResult >> AuthenticationMsg) ]


-- mouseMoveSubs : Model -> Sub Msg
-- mouseMoveSubs model =
--     case model.pool.move of
--         Nothing ->
--             Sub.none

--         Just _ ->
--             Sub.batch [ Mouse.moves MouseMove, Mouse.ups MouseEnd ]



-- MAIN --


main : Program (Maybe Auth0.LoggedInUser) Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = Update.update
        , subscriptions = subscriptions
        }
