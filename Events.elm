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
    , selectedEvent : Maybe Int
    }


navList : List ( String, String )
navList =
    [ ( "discover", "eye" ), ( "add", "plus-square" ), ( "share", "share-2" ), ( "chats", "message-square" ), ( "profile", "user" ) ]


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
      , selectedEvent = Nothing
      }
    , askQuery initQuery
    )



-- UPDATE


type Msg
    = GetReply (Result Http.Error Reply)
    | ViewEvent (Maybe Int)


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        GetReply (Ok recieved) ->
            ( Model (SeatGeek.Reply recieved.meta (model.seatgeek.events ++ recieved.events)) model.selectedEvent, Cmd.none )

        GetReply (Err e) ->
            let
                _ =
                    Debug.log "err" e
            in
                ( model, Cmd.none )

        ViewEvent (Just id) ->
            ( { model | selectedEvent = Just id }, Cmd.none )

        ViewEvent Nothing ->
            ( { model | selectedEvent = Nothing }, Cmd.none )



-- VIEW


tachyonsCSS : String
tachyonsCSS =
    "Admin/tachyons.css"


plusOneCSS : String
plusOneCSS =
    "Admin/plusOne.css"


view : Model -> Html Msg
view model =
    div [ class "overflow-hidden lg-breathe-50" ]
        [ Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href tachyonsCSS ] []
        , Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href plusOneCSS ] []
        , div [ class "white sans-serif flex fw1 vh-100 bg-black-80" ]
            [ navBar
            , main_ [ class "vh-100 w-100 pt5-m pb5 pb0-ns flex" ]
                [ eventsView model
                , eventView model
                ]
            ]
        ]


navBar : Html Msg
navBar =
    nav [ class "animate flipInY z-9999 w-100 w-auto-l h3 vh-100-l tc-l fixed flex-m flex-row-m items-center-m self-start-m absolute static-l top-0-m bottom-0 overflow-hidden" ]
        [ navHome
        , ul [ class "list ma0 pa0 flex flex-column-l items-start-l justify-around flex-auto items-center items-stretch-m h3 h-auto-l pr4-l f6 white-90" ]
            (List.map navTab navList)
        ]


navHome : Html Msg
navHome =
    div [ class "pa4-l ph3 grow hover-bg-black-50 flex-ns flex-column-l items-center dn" ]
        [ div [ bgImg "Assets/WhitePlusOneLogo.svg", class "contain bg-center ma2-l h3-l w3-l h2 w2" ] []
        , div
            [ class "fw7 pa3-m f4 pa2-l dib-l dn" ]
            [ text "PlusOne" ]
        ]


navTab : ( String, String ) -> Html Msg
navTab tuple =
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
        li [ class "grow ph4-l pv2-l mv2-l ph2 hover-bg-black-50 z-999 flex items-center br--right-l br-pill-l" ]
            [ div [ iconClasses, (featherIcon icon) ] []
            , div [ captionClasses ] [ text page ]
            ]


eventsView : Model -> Html Msg
eventsView model =
    section [ class "animated fadeInUp mw6-l w-50-ns w-100 bg-black-40 overflow-auto z-999 shadow-2 mr4-l mr2-l" ]
        [ div [ class "lg-magenta-purple-80 h5 flex flex-column justify-between pa4" ]
            [ input [ class "fw2 pa2 bg-transparent b--none outline-0 white focus-underline f4 f5-m self-stretch placeholder-white-50", placeholder "search", type_ "search" ]
                []
            , div [ class "tr f1 f2-m white lh-solid fw9 ma0 pa0" ]
                [ text "discover events" ]
            ]
        , div [] (List.map eventListView model.seatgeek.events)
        ]


selectedEvent : Model -> Maybe Event
selectedEvent model =
    List.head (List.filter (\x -> model.selectedEvent == Just x.id) model.seatgeek.events)


eventView : Model -> Html msg
eventView model =
    let
        event =
            selectedEvent model
    in
        case event of
            Nothing ->
                text ""

            Just event ->
                section [ class " w-50-ns dn db-ns vh-100" ]
                    [ article [ class "animated fadeInLeft mw6-l bg-black-20" ]
                        [ eventBanner event
                        , progressBar event.popularity
                        , progressBar event.score
                        , eventIcons event
                        ]
                    , nav [ class "animated fadeInUp flex justify-between w-50 fixed bottom-0 mw6-l pa2 f3" ]
                        [ div [ class "pa3 tc bg-blue-50 fw9" ]
                            [ text "buy tickets" ]
                        , div [ class "pa3 tc bg-magenta-50 fw9" ]
                            [ text "view pool" ]
                        ]
                    ]


progressBar : Float -> Html msg
progressBar num =
    let
        percent =
            num * 100
    in
        case percent of
            0.0 ->
                text ""

            percent ->
                div [ class "w-100 bg-black-20 overflow-hidden" ]
                    [ div [ style [ ( "width", ((toString percent) ++ "%") ) ], class "animate bounceInLeft pt2 lg-breathe-50" ] []
                    ]


eventIcons : Event -> Html msg
eventIcons event =
    let
        toIcon =
            div
                [ class "contain h2 w2 h1-m w1-m dib" ]
                []
    in
        ul [ class "w-auto h4 list ma0 pa0 flex white-50 justify-around items-center" ]
            (List.map eventIcon event.taxonomies)


eventIcon : Taxonomy -> Html msg
eventIcon taxonomy =
    let
        iconClasses =
            class "h3 w3 contain"

        captionClasses =
            class "ph2"

        badgeClasses =
            class "flex flex-column items-center"
    in
        case taxonomy.name of
            "concert" ->
                li [ badgeClasses ]
                    [ div [ iconClasses, (featherIcon "music") ] []
                    , div [ captionClasses ] [ text taxonomy.name ]
                    ]

            "sports" ->
                li [ badgeClasses ]
                    [ div [ iconClasses, (featherIcon "activity") ] []
                    , div [ captionClasses ] [ text taxonomy.name ]
                    ]

            "" ->
                li [ badgeClasses ]
                    [ div [ iconClasses, (featherIcon "alert-circle") ] []
                    , div [ captionClasses ] [ text taxonomy.name ]
                    ]

            _ ->
                li [ badgeClasses ]
                    [ div [ iconClasses, (featherIcon "alert-octagon") ] []
                    , div [ captionClasses ] [ text taxonomy.name ]
                    ]


randomGradient : Event -> String
randomGradient event =
    let
        randomSeed =
            ((String.length event.title) * (String.length event.url))

        randomIndex =
            randomSeed % (List.length gradients)

        selectedGradient =
            List.head (List.drop randomIndex gradients)
    in
        case selectedGradient of
            Nothing ->
                "white"

            Just result ->
                result ++ ""


eventBanner : Event -> Html msg
eventBanner event =
    let
        heroImg =
            case maybeImage event.performers of
                Nothing ->
                    style []

                Just image ->
                    style [ ( "background-image", "url(" ++ image ++ ")" ) ]

        titleSize =
            case ((String.length event.title) // 25) of
                0 ->
                    " f1 f2-m"

                1 ->
                    " f2 f3-m"

                2 ->
                    " f3 f4-m"

                3 ->
                    " f4 f5-m"

                _ ->
                    " f5 f6-m"
    in
        div [ class ("bg-darken " ++ (randomGradient event)) ]
            [ div
                [ heroImg
                , class ("bg-darken bg-center h5 flex flex-column justify-between pa4 cover")
                ]
                [ ul [ class "list white ma0 pa0 flex justify-end w-100 f7 pv2" ]
                    [ li [ class "grow dn dib-l pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-teal-50" ]
                        [ text "share" ]
                    , li [ class "grow dn dib-l pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-red-50" ]
                        [ text "like" ]
                    , li [ class "grow pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-mint-50" ]
                        [ text "more" ]
                    ]
                , div [ class ("tr f1 f2-m white lh-solid fw9 ma0 pa0" ++ titleSize) ]
                    [ text event.title ]
                ]
            ]


eventListView : Event -> Html Msg
eventListView event =
    let
        cardImage =
            case (maybeImage event.performers) of
                Just image ->
                    div [ class "w-100 mb2 mt1" ]
                        [ div [ style [ ( "background-image", "url(" ++ image ++ ")" ) ], class "aspect-ratio--8x5 cover" ]
                            []
                        ]

                Nothing ->
                    text ""
    in
        div [ class "ph3 pt3 hover-bg-black-30", onClick (ViewEvent (Just event.id)) ]
            [ cardImage
            , div [ class "pb3 bb b--white-20" ]
                [ div [ class "pb1 f4 fw6 pv2" ]
                    [ text event.title
                    , span [ class "fw5 white-70" ]
                        [ text (" @ " ++ event.venue.name) ]
                    ]
                , div [ class "pb2 flex justify-between items-center" ]
                    [ span [ class "fw2 white-50 ma0" ]
                        [ text event.datetime_local ]
                    , ul [ class "pa0 ma0 list dib" ] (List.map eventListIcon event.taxonomies)
                    ]
                ]
            ]


eventListIcon : Taxonomy -> Html msg
eventListIcon taxonomy =
    let
        iconClasses =
            (class "contain h1 w1 ml2 dib")
    in
        case taxonomy.name of
            "concert" ->
                li [ iconClasses, featherIcon "music" ] []

            "sports" ->
                li [ iconClasses, featherIcon "activity" ] []

            "" ->
                li [ iconClasses, featherIcon "alert-circle" ] []

            _ ->
                li [ iconClasses, featherIcon "alert-circle" ] []


maybeImage : List Performer -> Maybe String
maybeImage performers =
    case (List.head performers) of
        Just performer ->
            performer.image

        Nothing ->
            Nothing


featherIcon : String -> Attribute msg
featherIcon icon =
    (style [ ( "background-image", ("url('https://icongr.am/feather/" ++ icon ++ ".svg?size=20&color=ffffff')") ) ])


bgImg : String -> Attribute msg
bgImg imgPath =
    (style [ ( "background-image", ("url('" ++ imgPath ++ "')") ) ])



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- HTTP
