module View exposing (render)

import Types


-- DUCK TAPE --

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- PAGES --

import Pages.Chat as Chat
import Pages.Chats as Chats
import Pages.Profile as Profile
import Pages.Events as Events
import Pages.Event as Event
import Pages.Pool as Pool
import Pages.CreateEvent as CreateEvent


-- SUBVIEWS --

import Proto exposing (..)
import Nav exposing (..)


render : Types.Model -> Html Types.Msg
render model =
    Proto.bg
        [ div [ class "overflow-hidden animated fadeIn white flex fw4 f6 vh-100" ]
            (Proto.plusOne
                ++ [ Nav.bar
                   , main_ [ class "flex-auto pt5-m pb5 pb0-ns flex justify-stretch" ]
                        (page model)
                   ]
            )
        ]
    -- div
    --     [ class "overflow-hidden animated fadeIn white flex fw4 f6 vh-100" ]
    --     [ Nav.bar
    --     , main_ [ class "flex-auto pt5-m pb5 pb0-ns flex justify-stretch" ]
    --         (page model)
    --     ]


page : Types.Model -> List (Html Types.Msg)
page model =
    case model.route of
        Types.GoChats chat ->
            case chat of
                Nothing ->
                    [ Chats.view model ]

                Just x ->
                    [ Chats.view model
                    , Chat.view model
                    ]

        Types.GoProfile ->
            [ Profile.view model ]

        Types.GoPool ->
            [ Pool.view model.pool ]

        Types.GoCreateEvent ->
            [ CreateEvent.view model ]

        Types.GoEvents event ->
            case event of
                Nothing ->
                    [ Events.view model ]

                Just x ->
                    [ Events.view model
                    , Event.view x model.events.currentDatetime
                    ]
