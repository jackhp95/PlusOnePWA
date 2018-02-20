module View exposing (render)

import Types


-- DUCK TAPE --

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- PAGES --

import Pages.Chat.View as Chat
import Pages.Chats.View as Chats
import Pages.Profile.View as Profile
import Pages.Events.View as Events
import Pages.Event.View as Event
import Pages.Pool.View as Pool
import Pages.CreateEvent.View as CreateEvent
import Update exposing (..)


-- SUBVIEWS --

import Proto exposing (..)
import Nav exposing (..)


render : Types.Model -> Html Types.Msg
render model =
    Proto.bg
        [ div [ class "animated fadeIn f6 fw3 flex flex-column-l flex-row-m flex-column-reverse items-stretch vh-100 white" ]
            (Proto.plusOne
                ++ [ Nav.bar
                   , main_ [ class "flex-auto flex justify-stretch" ]
                        (page model)
                   ]
            )
        ]
    -- div
    --     [ class "animated fadeIn f6 fw3 flex flex-column-l flex-row-m flex-column-reverse items-stretch vh-100 white" ]
    --     [ Nav.bar
    --     , main_ [ class "flex-auto flex justify-stretch" ]
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
            [ Html.map Types.CreateEventMsg (CreateEvent.view model.createEvent) ]

        Types.GoEvents event ->
            case event of
                Nothing ->
                    [ Events.view model ]

                Just x ->
                    [ Events.view model
                    , Event.view x model.events.currentDatetime
                    ]
