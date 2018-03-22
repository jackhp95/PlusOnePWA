module Views.User exposing (..)

import EveryDict exposing (..)
import GraphCool.Scalar exposing (..)
import Helpers.Assets as Assets exposing (bgImg, feather, stringToEmoji)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe.Extra
import Types exposing (..)


view : User -> Model -> Html Msg
view user model =
    section [ class "w-100 mw7-l overflow-auto shadow-2-l" ]
        [ div [ class "flex h5 ph3 ph4-m ph5-l pt6 items-center" ]
            [ userAvi
            , div [ class "f2 fw7 ml3 fadeInUp animated" ] [ text <| .name user ]
            ]
        , div
            [ class "bg-black-70" ]
            [ div [ class "ph3 bg-black-30 w-100" ]
                [ userToolsView ]
            , userBio user
            , startChatting user
            , attendingEvents user model.events
            ]
        ]


startChatting : User -> Html Msg
startChatting user =
    div
        [ onClick <| RouteTo <| GoEvents Nothing
        , class "bg-white br1 pa2 mh1 flex items-center mh1"
        ]
        [ div [ class "blue-80 mh2 f4 fw4 ttn" ] [ text ("Start chatting with " ++ user.name ++ "!") ]
        ]


userAvi : Html Msg
userAvi =
    div [ class "w5 bounceIn animated z-9" ]
        [ div
            [ bgImg "https://images.unsplash.com/photo-1496361001419-80f0d1be777a"
            , class "aspect-ratio--1x1 bg-white br-pill shadow-2 ba bw1 cover br-pill"
            ]
            []
        ]


userBio : User -> Html Msg
userBio user =
    case user.bio of
        Nothing ->
            text ""

        Just bio ->
            div [ class "mv0 mh4 ph2 pv4 bb b--white-20" ]
                [ div [ class "fw7 pv2 f4" ] [ text "bio" ]
                , div [ class "pv2 lh-copy measure" ] [ text bio ]
                ]


attendingEvents : User -> EveryDict Id API -> Html Msg
attendingEvents user events =
    let
        apiToTuple api =
            case api of
                SeatGeek event ->
                    ( event.title, event.venue.name )

                GraphCool event ->
                    ( event.name, "location" )

        prevEvents =
            List.map (\eventId -> EveryDict.get eventId events) user.attendingEvent
                |> Maybe.Extra.values
                |> List.map apiToTuple

        eventCard ( performer, venue ) =
            td [ class "pr3 pl0 pt0 pb4 bb b--white-20" ]
                [ div [ class "w5 aspect-ratio--16x9 lg-breathe-50" ] []
                , div [ class "f5 fw6 pt2" ] [ text performer ]
                , div [ class "fw4 pt1" ] [ text venue ]
                ]
    in
    div [ class "ma0 pt4" ]
        [ div [ class "fw7 pv2 mh4 f4" ] [ text "attending events" ]
        , div [ class "mv2 overflow-auto" ]
            [ table [ class "white collapse mh4" ]
                [ tr []
                    (List.map eventCard prevEvents ++ [ td [ class "ph3" ] [] ])
                ]
            ]
        ]


userToolsView : Html Msg
userToolsView =
    div [ class "flex justify-end" ]
        [ div [ class "animated bounceIn pointer hover-bg-black-50 br-2 pa3 flex items-center" ]
            [ div [ Assets.feather "share", class "contain bg-center grow pt3 pb2 pl3 pr2" ] []
            , div [ class "pa2" ] [ text "share" ]
            ]
        , div [ class "animated bounceIn pointer hover-bg-black-50 br-2 pa3 flex items-center", onClick (Types.RouteTo GoAuth) ]
            [ div [ Assets.feather "log-out", class "contain bg-center grow pt3 pb2 pl3 pr2" ] []
            , div [ class "pa2" ] [ text "log out" ]
            ]
        ]
