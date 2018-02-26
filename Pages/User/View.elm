module Pages.User.View exposing (..)

import Assets exposing (bgImg, feather)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Nav exposing (bar)
import Pages.User.Model as UserModel
import Types


view : Types.Model -> Html msg
view x =
    let
        model =
            x.user
    in
    section [ class "w-100 mw7-l overflow-auto shadow-2-l" ]
        [ div [ class "flex h5 ph3 ph4-m ph5-l pt6 items-center" ]
            [ userAvi model.avi
            , div [ class "f2 fw7 ml3 fadeInUp animated" ] [ text model.name ]
            ]
        , div
            [ class "bg-black-70" ]
            [ div [ class "ph3 bg-black-30 w-100" ]
                [ userToolsView ]
            , userBio model
            , pastEvents model
            ]
        ]


userAvi : List String -> Html msg
userAvi avis =
    div [ class "w5 bounceIn animated z-9" ]
        [ div
            [ bgImg (Maybe.withDefault "" (List.head avis))
            , class "aspect-ratio--1x1 bg-white br-pill shadow-2 ba bw1 cover br-pill"
            ]
            []
        ]


userBio : UserModel.User -> Html msg
userBio model =
    div [ class "mv0 mh4 ph2 pv4 bb b--white-20" ]
        [ div [ class "fw7 pv2 f4" ] [ text "bio" ]
        , div [ class "pv2 lh-copy measure" ] [ text """
                look. life is bad. everyone's sad. we're all gonna die. but I already bought this inflatable bouncy castle, so are you gonna take your shoes off or what?
                """ ]
        ]


pastEvents : UserModel.User -> Html msg
pastEvents model =
    let
        prevEvents =
            [ ( "Kanye West", "Rose Music Hall" )
            , ( "Chance the Rapper", "The Blue Note" )
            , ( "LCD Soundsystem", "Jesse Hall" )
            , ( "Vulfpeck", "Ready room" )
            , ( "MU Tigers", "Football arena" )
            ]

        eventCard ( performer, venue ) =
            td [ class "pr3 pl0 pt0 pb4 bb b--white-20" ]
                [ div [ class "w5 aspect-ratio--16x9 lg-breathe-50" ] []
                , div [ class "f5 fw6 pt2" ] [ text performer ]
                , div [ class "fw4 pt1" ] [ text venue ]
                ]
    in
    div [ class "ma0 pt4" ]
        [ div [ class "fw7 pv2 mh4 f4" ] [ text "previous events" ]
        , div [ class "mv2 overflow-auto" ]
            [ table [ class "white collapse mh4" ]
                [ tr []
                    (List.map eventCard prevEvents ++ [ td [ class "ph3" ] [] ])
                ]
            ]
        ]


userToolsView : Html msg
userToolsView =
    let
        icon x =
            div [ class "animated bounceIn pointer hover-bg-black-50 br-2 pa3 flex items-center" ]
                [ div [ Assets.feather x, class "contain bg-center grow pt3 pb2 pl3 pr2" ] []
                , div [ class "pa2" ] [ text x ]
                ]
    in
    div [ class "flex justify-end" ]
        (List.map icon [ "settings", "edit" ])


stringToEmoji : String -> String
stringToEmoji string =
    case string of
        "night owl" ->
            "\x1F989"

        "talkative" ->
            "🗣️"

        "flirty" ->
            "😏"

        "funny" ->
            "\x1F923"

        _ ->
            "\x1F937"
