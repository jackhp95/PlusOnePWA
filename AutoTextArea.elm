module AutoTextArea exposing (view, initModel)

import Html exposing (Html, div, p, br, textarea, text)
import Html.Attributes exposing (rows, style)
import Html.Events exposing (onInput, on)
import Json.Decode exposing (Decoder, field, at, map2, int, string)
import Types exposing (NewValues)


type alias Model =
    { height : Int
    , inputText : String
    }


initModel : Model
initModel =
    { height = 0
    , inputText = ""
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewValues inputText height ->
            ( { model
                | inputText = inputText
                , height = height
              }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    textarea
        [ on "input" inputDecoder
        , Html.Attributes.value model.inputText
        , textareaStyles model.height
        ]
        []


inputDecoder : Decoder Msg
inputDecoder =
    map2 NewValues
        (at [ "target", "value" ] string)
        (at [ "target", "scrollHeight" ] int)


textareaStyles : Int -> Html.Attribute msg
textareaStyles height =
    style
        [ ( "resize", "none" )
        , ( "height", (toString height) )
        , ( "max-height", "50vh" )
        ]


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , init = ( initModel, Cmd.none )
        }
