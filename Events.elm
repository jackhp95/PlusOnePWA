-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Main exposing (..)

import SeatGeek exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Date exposing (..)
import Task exposing (..)
import Date.Extra.Duration exposing (..)


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
    , currentDatetime : Maybe Date
    }


navList : List ( String, String )
navList =
    [ ( "discover", "compass" ), ( "add", "plus-square" ), ( "share", "share-2" ), ( "chats", "message-square" ), ( "profile", "user" ) ]


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
      , currentDatetime = Nothing
      }
    , Cmd.batch [ askQuery initQuery, getDatetime ]
    )


getDatetime : Cmd Msg
getDatetime =
    Date.now
        |> Task.perform OnDatetime



-- UPDATE


type Msg
    = GetReply (Result Http.Error Reply)
    | ViewEvent (Maybe Int)
    | OnDatetime Date


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        GetReply (Ok recieved) ->
            ( Model (SeatGeek.Reply recieved.meta (model.seatgeek.events ++ recieved.events)) model.selectedEvent model.currentDatetime, Cmd.none )

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

        OnDatetime now ->
            ( { model | currentDatetime = Just now }, Cmd.none )



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
            , main_ [ class "flex-auto pt5-m pb5 pb0-ns flex justify-stretch" ]
                [ eventsView model
                , eventView model
                ]
            ]
        ]


navBar : Html Msg
navBar =
    nav [ class "z-9999 w-100 w-auto-l h3 vh-100-l tc-l fixed flex-m flex-row-m items-center-m self-start-m absolute static-l top-0-m bottom-0" ]
        [ navHome
        , ul [ class "list ma0 pa0 flex flex-column-l items-start-l justify-around flex-auto items-start-l items-stretch h3 h-auto-l pr3-l f6 o-90-ns bg-0-ns lg-breathe-50" ]
            (List.map navTab navList)
        ]


navHome : Html Msg
navHome =
    div [ class "grow-large ph4-l pv4-l ph3 flex-ns flex-column-l items-center dn" ]
        [ div [ bgImg "Assets/WhitePlusOneLogo.svg", class "animated bounceIn contain bg-center h3-l w3-l h2 w2" ] []
        , div
            [ class "animated bounceInLeft fw7 pa3-m f4 dib-l dn" ]
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
        li [ class "animated zoomInLeft grow pr3-l pl4-l pv2-l mv2-l ph2 pointer hover-bg-black-50 z-999 flex flex-auto justify-center items-center br--right-l br-pill-l" ]
            [ div [ iconClasses, (featherIcon icon) ] []
            , div [ captionClasses ] [ text page ]
            ]


eventsView : Model -> Html Msg
eventsView model =
    section [ class "animated fadeInUp mw6-ns bg-black-40 overflow-auto z-999 shadow-2 mr3-l mr2-m flex-grow-1" ]
        [ div [ class "lg-magenta-purple-80 h5 flex flex-column justify-between pa4 pa3-m" ]
            [ discoverToolsView
            , div [ class "tr f1 f2-m lh-solid fw8 ma0 pa0" ]
                [ text "discover events" ]
            ]
        , div [] (List.map eventListView model.seatgeek.events)
        ]


discoverToolsView : Html msg
discoverToolsView =
    let
        icon x =
            div [ class "animated bounceIn pointer hover-bg-black-20 br-pill pa2" ]
                [ div [ featherIcon x, class "contain bg-center grow pt3 pb2 pl3 pr2" ] []
                ]
    in
        div [ class "flex justify-end" ]
            [ icon "search"
            , icon "map-pin"
            , icon "thumbs-up"
            , icon "tag"
            , icon "at-sign"
            ]


selectedEvent : Model -> Maybe Event
selectedEvent model =
    List.head (List.filter (\x -> model.selectedEvent == Just x.id) model.seatgeek.events)


eventView : Model -> Html msg
eventView model =
    let
        event =
            selectedEvent model

        now =
            model.currentDatetime
    in
        case event of
            Nothing ->
                text ""

            Just event ->
                section [ class "dn db-ns vh-100 animated overflow-auto fadeInLeft mw7-ns flex-grow-1" ]
                    [ eventBanner event
                    , eventTitle event
                    , eventPopularity event
                    , eventIcons event
                    , eventTickets event
                    , eventTime event now
                    , div [] [ text (toString event) ]
                    ]


eventTitle : Event -> Html msg
eventTitle event =
    let
        icon x =
            div [ featherIcon x, class "contain dib bg-center grow mr2 mt1 pt1 pb3 pl1 pr3" ] []

        textSize x y =
            case ((String.length x) // y) of
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
        div [ class "bg-black-20 pa4" ]
            [ div [ class ("fw7" ++ textSize event.title 30) ]
                [ text event.title
                ]
            , div [ class "fw5 mv3 f3 flex items-start" ]
                [ icon "at-sign", text event.venue.name ]
            ]


eventTime : Event -> Maybe Date -> Html msg
eventTime event now =
    let
        eventDate =
            Result.toMaybe (Date.fromString event.datetime_local)

        invalidDates =
            List.any (\x -> x == Nothing)
                [ eventDate
                , now
                ]

        deltaRecord =
            case invalidDates of
                True ->
                    "Golly, it looks like there is a bee in our proverbial bonnet."

                False ->
                    toString (Maybe.map2 Date.Extra.Duration.diffDays eventDate now)
    in
        div [ class "bg-black-20 pa3" ]
            [ div [] [ text (toString event.datetime_local) ]
            , div [] [ text (toString eventDate) ]
            , div [] [ text (toString now) ]
            , div [] [ text (toString deltaRecord) ]
            ]


eventTickets : Event -> Html msg
eventTickets event =
    let
        emptyTickets =
            List.all (\x -> x == Nothing)
                [ event.stats.highest_price
                , event.stats.average_price
                , event.stats.lowest_price
                , event.stats.lowest_price_good_deals
                ]
    in
        case emptyTickets of
            False ->
                div [ class "flex items-center pa4 bg-black-20" ]
                    [ text (toString event.stats)
                    ]

            True ->
                text ""


eventPopularity : Event -> Html msg
eventPopularity event =
    case event.popularity of
        0.0 ->
            text ""

        _ ->
            div [ class "flex items-center ph4 pv4 bg-black-20" ]
                [ div [ class "mr3 f2" ] [ text "🔥" ]
                , div [ class "flex flex-column flex-auto h2 justify-around" ]
                    [ progressBar event.popularity
                    , progressBar event.score
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
                div [ class "w-100 bg-white-10 overflow-hidden br-pill" ]
                    [ div [ style [ ( "width", ((toString percent) ++ "%") ) ], class "animated slideInleft pt2 bg-red-50" ] []
                    ]


eventIcons : Event -> Html msg
eventIcons event =
    let
        toIcon x =
            li [ class "flex w4 mb2 flex-column items-center overflow-hidden" ]
                [ div [ class "f-subheadline f1-m" ] [ text (stringToEmoji (x.name)) ]
                , div [ class "pv2 o-70" ] [ text (x.name) ]
                ]
    in
        ul [ class "list ma0 pa4 pb3 flex justify-around items-center bg-black-40" ]
            (List.map toIcon event.taxonomies)


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
                ""

            Just result ->
                result ++ ""


eventBanner : Event -> Html msg
eventBanner event =
    let
        heroImg =
            case maybeImage event.performers of
                Nothing ->
                    class (randomGradient event)

                Just image ->
                    style [ ( "background-image", "url(" ++ image ++ ")" ) ]
    in
        div
            [ heroImg, class ("bg-center cover aspect-ratio aspect-ratio--16x9-l aspect-ratio--1x1-m ") ]
            [ div [ class "aspect-ratio--object cover" ] [] ]


eventListView : Event -> Html Msg
eventListView event =
    let
        atIcon =
            div
                [ featherIcon "at-sign"
                , class "contain dib bg-center mr1 pb3 pr3"
                ]
                []

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
        div [ class "animated fadeInUp ph3 pt3 hover-bg-black-30", onClick (ViewEvent (Just event.id)) ]
            [ cardImage
            , div [ class "pb3 bb b--white-20" ]
                [ div [ class "pb1 f4 pv2" ]
                    [ span [ class "mr2" ] [ text event.title ]
                    , div [ class "fw4 o-70 dib" ]
                        [ atIcon, text event.venue.name ]
                    ]
                , div [ class "pb2 flex justify-between items-center" ]
                    [ span [ class "fw2 o-50 ma0" ]
                        [ text event.datetime_local ]
                    , ul [ class "pa0 ma0 list dib" ]
                        (List.map (\x -> li [ class "ml2 dib" ] [ text (stringToEmoji x.name) ]) event.taxonomies)
                    ]
                ]
            ]


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



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- HTTP
