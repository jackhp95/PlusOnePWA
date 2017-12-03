module View exposing (render)

import Types


-- DUCK TAPE --

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- PAGES --

import Pages.Chat as Chat
import Pages.Profile as Profile
import Pages.Events as Events
import Pages.Event as Event


-- SUBVIEWS --

import Proto exposing (..)
import Nav exposing (..)


render : Types.Model -> Html Types.Msg
render model =
    Proto.bg
        [ div [ class "overflow-hidden animated fadeIn ttl white flex fw4 vh-100" ]
            (Proto.importLinks
                ++ [ Nav.bar
                   , main_ [ class "flex-auto pt5-m pb5 pb0-ns flex justify-stretch" ]
                        (page model)
                   ]
            )
        ]


page : Types.Model -> List (Html Types.Msg)
page model =
    case model.route of
        Types.GoChat ->
            [ Chat.view model ]

        Types.GoProfile ->
            [ Profile.view model ]

        Types.GoEvents event ->
            case event of
                Nothing ->
                    [ Events.view model ]

                Just x ->
                    [ Events.view model
                    , Event.view x model.events.currentDatetime
                    ]
