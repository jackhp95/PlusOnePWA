module View exposing (render)

import Types


-- DUCK TAPE --

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- PAGES --

import Chat exposing (..)
import Profile exposing (..)
import Events exposing (..)


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
                        [ page model ]
                   ]
            )
        ]


page : Types.Model -> Html Types.Msg
page model =
    case model.route of
        Types.GoChat ->
            Chat.view model

        Types.GoProfile ->
            Profile.view model

        Types.GoEvent ->
            Chat.view model

        Types.GoEvents ->
            Events.eventsView model.events
