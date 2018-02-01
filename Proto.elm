-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/web_sockets.html


module Proto exposing (plusOne, bg)

import Html exposing (node, Html, div)
import Html.Attributes exposing (rel, href, class)


plusOne : List (Html msg)
plusOne =
    responsive :: importLinks


responsive : Html msg
responsive =
    node "meta"
        [ Html.Attributes.name "viewport"
        , Html.Attributes.content "width=device-width, initial-scale=1, maximum-scale=1"
        ]
        []


linkURLs : List String
linkURLs =
    [ "https://unpkg.com/tachyons@4.9.0/css/tachyons.min.css"

    -- , "Styles/tachyons.css"
    , "Styles/plusOne.css"
    , "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"
    ]


importLinks : List (Html msg)
importLinks =
    List.map toStylesheet linkURLs


toStylesheet : String -> Html msg
toStylesheet x =
    Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href x ] []


bg : List (Html msg) -> Html msg
bg x =
    div [ class "lg-breathe-50" ] x

