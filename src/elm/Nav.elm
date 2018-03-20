-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Nav exposing (bar)

import Assets exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import List exposing (map)
import Types exposing (..)


selections : List Page
selections =
    let
        makePage ( x, y, z ) =
            Page x y z
    in
    List.map makePage
        [ ( "discover", "compass", Types.GoEvents Nothing )
        , ( "add", "plus-square", Types.GoCreateEvent )
        , ( "chats", "message-square", Types.GoChats Nothing )
        ]


bar : Model -> Html Msg
bar model =
    let
        mobileBack =
            li [ class "flex dn-ns flex-column-reverse items-stretch hide-child glow w-20" ]
                [ span [ class "grow flex-auto flex flex-column items-center pv2" ]
                    [ div [ class "mr3-ns mr0 mb1 mb0-ns pa2-ns pl3 pt3 pr2 pb2 contain", Assets.feather "chevron-left" ] []
                    , text "back"
                    ]
                , div [ class "b--white ba child" ] []
                ]

        userTab model =
            -- case Nothing of
            --     Nothing ->
            tab <| Page "login" "user" Types.GoAuth

        -- Just user ->
        --     li
        --         [ class "flex flex-column-l flex-row-m flex-column-reverse items-stretch hide-child ph3-l glow w-20 w-auto-ns"
        --         , onClick (RouteTo Types.GoUser)
        --         ]
        --         [ span [ class "grow flex-auto flex flex-column flex-row-ns items-center pv3-ns pv2 pv4-l ph2-l mv1-m pl3-m pr4-m w-auto-ns" ]
        --             [ div [ class "br-pill mr3-ns mr0 mb1 mb0-ns pa2-ns pl3 pt3 pr2 pb2 contain", bgImg user.picture ] []
        --             , text user.family_name
        --             ]
        --         , div [ class "b--white ba child" ] []
        --         ]
    in
    nav [ class "f5-ns f7 fw4 flex-none pv3-m ph4-l pa0 z-max flex flex-column-l bg-black-40" ]
        [ ul [ class "flex flex-column-m list ma0 pa0 overflow-visible-ns overflow-hidden w-100 w-auto-ns" ] <|
            List.concat
                [ [ home ], [ mobileBack ], List.map tab selections, [ userTab model ] ]
        ]


home : Html Msg
home =
    div [ class "dn flex-auto-l flex-ns items-center justify-center-m" ]
        [ div
            [ class "grow-large flex flex-column-m ph4-l pa3-m"
            , Types.GoEvents Nothing
                |> RouteTo
                |> onClick
            ]
            [ div
                [ bgImg "logo/svg/oColor.svg"
                , class "animated bounceIn pb4-m pr4-m pl3 pt3 pr2 pb2 contain bg-center"
                ]
                []
            , div
                [ class "animated bounceInLeft fw6 f4 pv2-m ph3-l" ]
                [ text "PlusOne" ]
            ]
        ]


tab : Page -> Html Msg
tab x =
    let
        icon =
            x.icon

        name =
            x.name

        route =
            x.route
    in
    li [ class "flex flex-column-l flex-row-m flex-column-reverse items-stretch hide-child ph3-l glow w-20 w-auto-ns", onClick (RouteTo route) ]
        [ span [ class "grow flex-auto flex flex-column flex-row-ns items-center pv3-ns pv2 pv4-l ph2-l mv1-m pl3-m pr4-m w-auto-ns" ]
            [ div [ class "mr3-ns mr0 mb1 mb0-ns pa2-ns pl3 pt3 pr2 pb2 contain", Assets.feather icon ] []
            , text name
            ]
        , div [ class "b--white ba child" ] []
        ]
