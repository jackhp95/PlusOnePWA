module TextArea exposing (auto)

import Html exposing (Html, div, p, br, textarea, text)
import Html.Attributes exposing (rows, style)
import Html.Events exposing (onInput, on)
import Json.Decode exposing (Decoder, field, at, map, int, string)
import Types


auto : Types.Client -> List (Html.Attribute Types.Msg)
auto client =
    let
        height =
            client.textAreaHeight
    in
        [ on "input" scrollHeightDecoder
        , textareaStyles
        , textareaRows height
        ]


scrollHeightDecoder : Decoder Types.Msg
scrollHeightDecoder =
    map Types.TextAreaResizer
        (at [ "target", "scrollHeight" ] int)


textareaRows : Int -> Html.Attribute msg
textareaRows x =
    let
        calc =
            round ((toFloat (x - 32)) / 18.4)

        rowsNum =
            if calc < 2 then
                1
            else
                calc - 1
    in
        rows rowsNum


textareaStyles : Html.Attribute msg
textareaStyles =
    style
        [ ( "resize", "none" )
        , ( "max-height", "40vh" )
        ]
