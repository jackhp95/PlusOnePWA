-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html
-- https://icongr.am/feather


module Assets exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)


bgImg : String -> Attribute msg
bgImg imgPath =
    (style [ ( "background-image", ("url('" ++ imgPath ++ "')") ) ])


feather : String -> Html.Attribute msg
feather icon =
    bgImg ("https://icongr.am/feather/" ++ icon ++ ".svg?size=20&color=ffffff")


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
