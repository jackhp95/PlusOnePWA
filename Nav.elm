-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Nav exposing (bar)

import Html exposing (..)
import Html.Attributes exposing (style, class, href)
import Icon exposing (..)
import List exposing (map)


selections : List ( String, String )
selections =
    [ ( "discover", "compass" ), ( "add", "plus-square" ), ( "share", "share-2" ), ( "chats", "message-square" ), ( "profile", "user" ) ]


bar : Html msg
bar =
    nav [ class "z-9999 w-100 w-auto-l h3 vh-100-l tc-l fixed flex-m flex-row-m items-center-m self-start-m absolute static-l top-0-m bottom-0" ]
        [ home
        , ul [ class "list ma0 pa0 flex flex-column-l items-start-l justify-around flex-auto items-start-l items-stretch h3 h-auto-l pr3-l f6 o-90-ns bg-0-ns lg-breathe-50" ]
            (List.map tab selections)
        ]


home : Html msg
home =
    a [ href "index.html", class "white link" ]
        [ div [ class "grow-large ph4-l pv4-l ph3 flex-ns flex-column-l items-center dn" ]
            [ div [ bgImg "Assets/WhitePlusOneLogo.svg", class "animated bounceIn contain bg-center h3-l w3-l h2 w2" ] []
            , div
                [ class "animated bounceInLeft fw7 pa3-m f4 dib-l dn ttn" ]
                [ text "PlusOne" ]
            ]
        ]


tab : ( String, String ) -> Html msg
tab tuple =
    let
        icon =
            Tuple.second tuple

        page =
            Tuple.first tuple

        iconClasses =
            (class "w2 h2 w1-m h1-m contain")

        captionClasses =
            (class "pa3 pa2-m dn dib-ns")
    in
        a [ href "Profile.html", class "white link flex flex-auto" ]
            [ li [ class "animated zoomInLeft grow pr3-l pl4-l pv2-l mv2-l ph2 pointer hover-bg-black-50 z-999 flex flex-auto justify-center items-center br--right-l br-pill-l " ]
                [ div [ iconClasses, (Icon.feather icon) ] []
                , div [ captionClasses ] [ text page ]
                ]
            ]
