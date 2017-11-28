module Profile exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Nav exposing (bar)
import Icon exposing (feather, bgImg)


type alias Model =
    { name : String
    , avi : List String
    , traits : List Trait
    }


type alias Trait =
    { name : String
    , from : String
    , datetime : String
    }


initModel : Model
initModel =
    { name = "Hannah Hazeldine"
    , avi = [ "https://images.unsplash.com/photo-1496361001419-80f0d1be777a?dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D" ]
    , traits = [ { name = "night owl", from = "tommy", datetime = "" }, { name = "flirtatious", from = "tommy", datetime = "" }, { name = "talkative", from = "tommy", datetime = "" }, { name = "funny", from = "tommy", datetime = "" } ]
    }


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


init : ( Model, Cmd Msg )
init =
    ( initModel
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- Geolocation.changes (UpdateGeolocation << Ok)


type Msg
    = Test


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Test ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "lg-breathe-50 overflow-hidden" ]
        [ Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href tachyonsCSS ] []
        , Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href plusOneCSS ] []
        , Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href animateCSS ] []
        , div [ class "white sans-serif flex fw1 vh-100 bg-black-60" ]
            [ Nav.bar
            , main_ [ class "flex-auto pt5-m mb5 mb0-ns flex justify-stretch" ]
                [ profileView model
                ]
            ]
        ]


profileView : Model -> Html msg
profileView model =
    section [ class "w-100 bg-black-20 mw7-l" ]
        [ div [ class "lg-breathe-50 flex h5 ph3 ph4-m ph5-l pt6 items-center" ]
            [ profileAvi model.avi
            , div [ class "f2 fw8 ml3" ] [ text model.name ]
            ]
        , div [ class "ph4 pv3 bg-black-20 w-100" ] [ profileToolsView ]
        , div [ class "mv0 mh4 ph0 pt4 pb3 bb b--white-20" ]
            [ div [ class "fw8 pv2" ] [ text "bio" ]
            , div [ class "pv2 lh-copy measure" ] [ text """
                Look, life is bad. everyone's sad. we're all gonna die. But I already bought this inflatable bouncy castle, so are you gonna take your shoes off or what?
                """ ]
            ]
        , traitsIcons model.traits
        ]


profileAvi : List String -> Html msg
profileAvi avis =
    div [ class "w5" ]
        [ div
            [ bgImg (Maybe.withDefault "" (List.head avis))
            , class "aspect-ratio--1x1 lg-breathe-50 br-pill shadow-2 ba bw1 cover bg-center br-pill"
            ]
            []
        ]



-- traitsIcons : List String -> Html msg
-- traitsIcons traits =
--     let
--         toIcon x =
--             li [ class "flex w4 flex-column items-center overflow-hidden pointer animated zoomIn" ]
--                 [ div [ class "f-subheadline f1-m grow" ] [ text x.name ]
--                 , div [ class "pv2 o-70" ] [ text (Maybe.withDefault x.name (List.head (String.split "_" x.name))) ]
--                 ]
--     in
--         ul [ class "list mv0 mh4 ph0 pt4 pb3 flex justify-around items-center bb b--white-20" ]
--             (List.map toIcon traits)


profileToolsView : Html msg
profileToolsView =
    let
        icon x =
            div [ class "animated bounceIn pointer hover-bg-black-50 br-pill pa2" ]
                [ div [ Icon.feather x, class "contain bg-center grow pt3 pb2 pl3 pr2" ] []
                ]
    in
        div [ class "flex justify-end" ]
            [ icon "search"
            , icon "map-pin"
            , icon "thumbs-up"
            , icon "tag"
            , icon "at-sign"
            ]


traitsIcons : List Trait -> Html msg
traitsIcons traits =
    let
        toIcon x =
            li [ class "flex w4 flex-column items-center overflow-hidden pointer animated zoomIn" ]
                [ div [ class "f-subheadline-l f1 grow" ] [ text (stringToEmoji (x.name)) ]
                , div [ class "pv2 o-70" ] [ text (Maybe.withDefault x.name (List.head (String.split "_" x.name))) ]
                ]
    in
        ul [ class "list mv0 mh4 ph0 pt4 pb3 flex justify-around items-center bb b--white-20" ]
            (List.map toIcon traits)


stringToEmoji : String -> String
stringToEmoji string =
    case string of
        "night owl" ->
            "\x1F989"

        "talkative" ->
            "🗣️"

        "flirtatious" ->
            "😏"

        "funny" ->
            "\x1F923"

        _ ->
            "\x1F937"


tachyonsCSS : String
tachyonsCSS =
    "Admin/tachyons.css"


plusOneCSS : String
plusOneCSS =
    "Admin/plusOne.css"


animateCSS : String
animateCSS =
    "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"
