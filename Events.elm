-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Main exposing (..)

import SeatGeek exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { seatgeek : SeatGeek.Reply
    }


askQuery : Query -> Cmd Msg
askQuery query =
    let
        url =
            composeRequest query

        request =
            Http.get url decodeReply
    in
        Http.send GetReply request


init : ( Model, Cmd Msg )
init =
    ( { seatgeek = SeatGeek.emptyReply
      }
    , askQuery initQuery
    )



-- UPDATE


type Msg
    = GetReply (Result Http.Error Reply)


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        GetReply (Ok recieved) ->
            ( Model (SeatGeek.Reply recieved.meta (model.seatgeek.events ++ recieved.events)), Cmd.none )

        GetReply (Err e) ->
            let
                _ =
                    Debug.log "err" e
            in
                ( model, Cmd.none )



-- VIEW


tachyonsCSS : String
tachyonsCSS =
    "Admin/tachyons.css"


plusOneCSS : String
plusOneCSS =
    "Admin/plusOne.css"


view : Model -> Html Msg
view model =
    div [ class "overflow-hidden lg-purple-magenta-80" ]
        [ Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href tachyonsCSS ] []
        , Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href plusOneCSS ] []
        , div [ class "white sans-serif flex fw1 vh-100" ]
            [ navBar
            , main_ [ class "vh-100 w-100 bg-black-50 pl6-l pt5-m flex" ]
                [ feedView model
                , eventView (List.head model.seatgeek.events)
                ]
            ]
        ]


navBar : Html Msg
navBar =
    nav [ class "bg-black-40 bg-black-90 z-9999 w-100 w4-l h3 vh-100-l tc-l fixed flex-m flex-row-m items-center-m self-start-m absolute bottom-0 shadow-2" ]
        [ navHome
        , ul [ class "list ma0 pa0 flex flex-column-l justify-around flex-auto items-center h3 h-auto-l f6 white-90" ]
            (List.map navTab [ "discover", "add", "stats", "chats", "profile" ])
        , div [ class "dn-ns absolute bottom-0 h3 z-0 w-100 bg-black-90" ] []
        ]


navHome : Html Msg
navHome =
    div [ class "fw7 w4-l pv4 pa3-m dn dib-ns f4" ] [ text "PlusOne" ]


navTab : String -> Html Msg
navTab page =
    li [ class "w4-l pv3-l hover-bg-black-50 z-999" ] [ text page ]


feedView : Model -> Html Msg
feedView model =
    section [ class "measure bg-black-20 overflow-auto z-999 shadow-2 pb5" ]
        [ div [ class "lg-magenta-purple-80 h5 flex flex-column justify-between pa4" ]
            [ input [ class "fw2 pa2 bg-transparent b--none outline-0 white focus-underline f4 f5-m self-stretch placeholder-white-50", placeholder "search", type_ "search" ]
                []
            , div [ class "tr f1 f2-m white lh-solid fw9 ma0 pa0" ]
                [ text "discover events" ]
            ]
        , div [] (List.map eventListView model.seatgeek.events)
        ]


eventView : Maybe Event -> Html msg
eventView event =
    case event of
        Nothing ->
            text ""

        Just event ->
            section [ class "flex-auto dn db-ns vh-100" ]
                [ div [ class "lg-mint-red-30 h5 flex flex-column justify-between pa4" ]
                    [ ul [ class "list white ma0 pa0 flex justify-end w-100 f7 pv2" ]
                        [ li [ class "grow-large dn dib-l pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-teal-50" ]
                            [ text "share" ]
                        , li [ class "grow-large dn dib-l pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-red-50" ]
                            [ text "like" ]
                        , li [ class "grow-large pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-mint-50" ]
                            [ text "more" ]
                        ]
                    , div [ class "tr f1 f2-m white lh-solid fw9 ma0 pa0" ]
                        [ text event.title ]
                    ]
                , eventIcons event
                , div [ class "flex fixed flex-auto self-end" ]
                    [ h3 [ class "pa3 flex-auto tc f3 bg-blue-50 fw9" ]
                        [ text "buy tickets" ]
                    , h3 [ class "pa3 flex-auto tc f3 bg-magenta-50 fw9" ]
                        [ text "view pool" ]
                    ]
                ]


eventBanner : Event -> Html msg
eventBanner event =
    div [ class "lg-mint-red-30 h5 flex flex-column justify-between pa4" ]
        [ ul [ class "list white ma0 pa0 flex justify-end w-100 f7 pv2" ]
            [ li [ class "grow-large dn dib-l pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-teal-50" ]
                [ text "share" ]
            , li [ class "grow-large dn dib-l pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-red-50" ]
                [ text "like" ]
            , li [ class "grow-large pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-mint-50" ]
                [ text "more" ]
            ]
        , div [ class "tr f1 f2-m white lh-solid fw9 ma0 pa0" ]
            [ text event.title ]
        ]


eventIcons : Event -> Html msg
eventIcons event =
    let
        icons =
            [ ( "Category", event.category )
            , ( "Score", (toString event.score) )
            , ( "Popularity", (toString event.popularity) )
            ]
    in
        ul [ class "w-100 h4 list ma0 pa0 flex white-50 justify-around items-center" ]
            (List.map eventIcon icons)


eventIcon : ( String, String ) -> Html msg
eventIcon tuple =
    let
        desc =
            Tuple.first tuple

        data =
            Tuple.second tuple
    in
        case data of
            "0.0" ->
                text ""

            "0" ->
                text ""

            "" ->
                text ""

            data ->
                li [] [ text (desc ++ " is " ++ data) ]


eventListView : Event -> Html msg
eventListView event =
    div [ class "ph3 pt3 hover-bg-black-30" ]
        [ maybeImage event.performers
        , div [ class "pb3 bb b--white-20" ]
            [ div [ class "pb1 f4 fw6 pv2" ]
                [ text event.title
                , span [ class "fw5 white-70" ]
                    [ text (" @ " ++ event.venue.name) ]
                ]
            , div [ class "pb2" ]
                [ div [ class "fw2 white-50 ma0" ]
                    [ text event.datetime_local ]
                ]
            ]
        ]


maybeImage : List Performer -> Html msg
maybeImage performers =
    let
        performer =
            List.head performers

        image =
            case performer of
                Just performer ->
                    performer.image

                Nothing ->
                    Nothing
    in
        case image of
            Just image ->
                div [ class "w-100 mb2 mt1" ]
                    [ div [ style [ ( "background-image", "url(" ++ image ++ ")" ) ], class "aspect-ratio--8x5 cover" ]
                        []
                    ]

            Nothing ->
                text ""



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- HTTP
