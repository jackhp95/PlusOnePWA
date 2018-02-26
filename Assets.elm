-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html
-- https://icongr.am/feather


module Assets exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)


bgImg : String -> Attribute msg
bgImg imgPath =
    style [ ( "background-image", "url('" ++ imgPath ++ "')" ) ]


feather : String -> Html.Attribute msg
feather icon =
    bgImg ("https://icongr.am/feather/" ++ icon ++ ".svg?size=20&color=ffffff")


discoverToolsView : Html msg
discoverToolsView =
    let
        icon x =
            div [ class "animated bounceIn pointer hover-bg-black-50 br-pill pa2" ]
                [ div [ feather x, class "contain bg-center grow pt3 pb2 pl3 pr2" ] []
                ]
    in
    div [ class "flex justify-end" ]
        (List.map icon
            [ "search"
            , "map-pin"
            , "thumbs-up"
            , "tag"
            , "at-sign"
            ]
        )


stringToEmoji : String -> String
stringToEmoji string =
    case string of
        "concert" ->
            "🎵"

        "music_festival" ->
            "🎶"

        "sports" ->
            "🏆"

        "theater" ->
            "🎭"

        "basketball" ->
            "🏀"

        "nba" ->
            "⛹"

        "ncaa_football" ->
            "👨\x1F3FB\x200D🎓"

        "ncaa_basketball" ->
            "👨\x1F3FB\x200D🎓"

        "ncaa_womens_basketball" ->
            "👩\x200D🎓"

        "wnba" ->
            "⛹️\x200D♀️"

        "family" ->
            "🚸"

        "broadway_tickets_national" ->
            "🎟"

        "dance_performance_tour" ->
            "💃"

        "classical" ->
            "🎼"

        "classical_orchestral_instrumental" ->
            "🎻"

        "comedy" ->
            "\x1F923"

        "hockey" ->
            "\x1F3D2"

        "fighting" ->
            "\x1F93C\x200D♂️"

        "soccer" ->
            "⚽"

        "wrestling" ->
            "\x1F93C"

        "football" ->
            "🏈"

        "auto_racing" ->
            "🏎️"

        "animal_sports" ->
            "🐾"

        "horse_racing" ->
            "🏇"

        "rodeo" ->
            "\x1F920"

        "nfl" ->
            "🏟️"

        "cirque_du_soleil" ->
            "\x1F938"

        "classical_opera" ->
            "🎤"

        _ ->
            "\x1F937"



-- GRADIENTS --


gradients : List String
gradients =
    [ "lg-magenta-red"
    , "lg-purple-magenta"
    , "lg-blue-purple"
    , "lg-teal-blue"
    , "lg-mint-teal"
    , "lg-green-mint"
    , "lg-yellow-green"
    , "lg-red-yellow"
    , "lg-magenta-yellow"
    , "lg-purple-red"
    , "lg-blue-magenta"
    , "lg-teal-purple"
    , "lg-mint-blue"
    , "lg-green-teal"
    , "lg-yellow-mint"
    , "lg-red-green"

    -- , "lg-magenta-green"
    -- , "lg-purple-yellow"
    -- , "lg-blue-red"
    -- , "lg-teal-magenta"
    -- , "lg-mint-purple"
    -- , "lg-green-blue"
    -- , "lg-yellow-teal"
    -- , "lg-red-mint"
    -- , "lg-magenta-mint"
    -- , "lg-purple-green"
    -- , "lg-blue-yellow"
    -- , "lg-teal-red"
    -- , "lg-mint-magenta"
    -- , "lg-green-purple"
    -- , "lg-yellow-blue"
    -- , "lg-red-teal"
    -- , "lg-magenta-teal"
    -- , "lg-purple-mint"
    -- , "lg-blue-green"
    -- , "lg-teal-yellow"
    -- , "lg-mint-red"
    -- , "lg-green-magenta"
    , "lg-yellow-purple"
    , "lg-red-blue"
    , "lg-magenta-blue"
    , "lg-purple-teal"
    , "lg-blue-mint"
    , "lg-teal-green"
    , "lg-mint-yellow"
    , "lg-green-red"
    , "lg-yellow-magenta"
    , "lg-red-purple"
    , "lg-magenta-purple"
    , "lg-purple-blue"
    , "lg-blue-teal"
    , "lg-teal-mint"
    , "lg-mint-green"
    , "lg-green-yellow"
    , "lg-yellow-red"
    , "lg-red-magenta"
    ]


randomGradient : Int -> String
randomGradient seed =
    let
        randomIndex =
            seed % List.length gradients

        selectedGradient =
            List.head (List.drop randomIndex gradients)
    in
    case selectedGradient of
        Nothing ->
            ""

        Just result ->
            result ++ ""


banner : String -> Html msg
banner title =
    div
        [ class "w-100 pa3 flex flex-grow-1 flex-shrink-0 justify-between" ]
        [ div
            [ class "self-end f2 lh-solid fw7 flex-shrink-1" ]
            [ text title ]
        , div [ class "self-start flex-shrink-0" ] [ discoverToolsView ]
        ]
