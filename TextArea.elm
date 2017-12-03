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
        , textareaStyles height
        ]


scrollHeightDecoder : Decoder Types.Msg
scrollHeightDecoder =
    map Types.TextAreaResizer
        (at [ "target", "scrollHeight" ] int)


textareaStyles : Int -> Html.Attribute msg
textareaStyles x =
    let
        height =
            case x of
                0 ->
                    "22px"

                _ ->
                    (toString (x - 4)) ++ "px"
    in
        style
            [ ( "resize", "none" )
            , ( "height", height )
            , ( "max-height", "50vh" )
            ]
