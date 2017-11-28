-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html
-- https://icongr.am/feather


module Icon exposing (feather, bgImg)

import Html exposing (..)
import Html.Attributes exposing (style)


bgImg : String -> Attribute msg
bgImg imgPath =
    (style [ ( "background-image", ("url('" ++ imgPath ++ "')") ) ])


feather : String -> Html.Attribute msg
feather icon =
    bgImg ("https://icongr.am/feather/" ++ icon ++ ".svg?size=20&color=ffffff")
