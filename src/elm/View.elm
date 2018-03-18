module View exposing (render)

-- DUCK TAPE --
-- PAGES --
-- SUBVIEWS --
-- SUBVIEWS --
-- import Html.Events exposing (..)

import Dict exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Nav exposing (..)
import Pages.Chat.View as Chat
import Pages.Chats.View as Chats
import Pages.CreateEvent.View as CreateEvent
import Pages.EditMe.View as EditMe
import Pages.Event.View as Event
import Pages.Events.View as Events
import Pages.Pool.View as Pool
import Pages.User.View as User
import Types exposing (..)


render : Model -> Html Msg
render model =
    div
        [ class "animated fadeIn f6 fw3 flex flex-column-l flex-row-m flex-column-reverse items-stretch vh-100 white" ]
        [ Nav.bar model
        , main_ [ class "flex-auto flex justify-stretch" ]
            (page model)
        ]


page : Model -> List (Html Msg)
page model =
    let
        me =
            case model.me of
                Nothing ->
                    initMe

                Just me ->
                    me
    in
    case model.route of
        GoChats chatId ->
            case chatId of
                Nothing ->
                    [ Chats.view model ]

                Just chatId ->
                    let
                        chat =
                            Maybe.withDefault initChat <| Dict.get (toString chatId) model.chats
                    in
                    [ Chats.view model
                    , Chat.view chat me.id model
                    ]

        GoUser userId ->
            [ User.view userId model ]

        GoPool poolId ->
            [ Pool.view poolId model ]

        GoEditMe ->
            [ EditMe.view model ]

        GoCreateEvent ->
            [ CreateEvent.view model ]

        GoEvents event ->
            case event of
                Nothing ->
                    [ Events.view model ]

                Just x ->
                    [ Events.view model
                    , Event.view model
                    ]

        _ ->
            [ Events.view model ]
