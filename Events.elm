-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Events exposing (..)

import Types exposing (Msg, Events)
import SeatGeek exposing (..)
import SeatGeekTypes as SG
import Nav exposing (bar)
import Assets exposing (feather)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Date exposing (..)
import Task exposing (..)
import Date.Extra.Format exposing (..)
import Date.Extra.Duration exposing (..)
import Date.Extra.Config.Config_en_us exposing (..)
import Date.Extra.I18n.I_en_us exposing (..)


askQuery : SG.Query -> Cmd Msg
askQuery query =
    let
        url =
            SeatGeek.composeRequest query

        request =
            Http.get url SeatGeek.decodeReply
    in
        Http.send Types.GetReply request



-- VIEW


view : Types.Events -> Html Msg
view model =
    div [ class "overflow-hidden animated fadeIn ttl white flex fw4 vh-100 bg-black-60" ]
        [ Nav.bar
        , main_ [ class "flex-auto pt5-m pb5 pb0-ns flex justify-stretch" ]
            [ eventsView model
            , eventView model
            ]
        ]


eventsView : Types.Events -> Html Msg
eventsView model =
    section [ class "animated fadeInUp mw6-ns overflow-auto z-999 mr3-l mr2-m flex-grow-1 shadow-2-l" ]
        [ div [ class "h5 flex flex-column justify-between pa3" ]
            [ discoverToolsView
            , div [ class "f1 f2-m lh-solid fw7 ma0 pa0" ]
                [ text "discover events" ]
            ]
        , div [ class "bg-black-70" ] (List.map (eventListView model.currentDatetime) model.seatgeek.events)
        ]


discoverToolsView : Html msg
discoverToolsView =
    let
        icon x =
            div [ class "animated bounceIn pointer hover-bg-black-50 br-pill pa2" ]
                [ div [ Assets.feather x, class "contain bg-center grow pt3 pb2 pl3 pr2" ] []
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


selectedEvent : Types.Events -> Maybe SG.Event
selectedEvent model =
    List.head (List.filter (\x -> model.selectedEvent == Just x.id) model.seatgeek.events)


eventView : Types.Events -> Html msg
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
                section [ class "dn db-ns vh-100 animated overflow-auto fadeInLeft mw7-ns flex-grow-1 bg-black-80 shadow-2-l" ]
                    [ eventBanner event
                    , eventTitle event
                    , eventIcons event
                    , eventTime event now
                    , eventPool
                    , eventPopularity event
                    , yetToBeAdded
                    ]


eventTitle : SG.Event -> Html msg
eventTitle event =
    let
        icon x =
            div [ Assets.feather x, class "contain dib bg-center grow ml1 mr2 pt1 pb3 pl1 pr3" ] []

        textSize x y =
            case ((String.length x) // y) of
                0 ->
                    " f-subheadline"

                1 ->
                    " f1"

                _ ->
                    " f2"
    in
        div [ class "pt4 pb3 mh4 bb b--white-20" ]
            [ div [ class ("fw6 pv1 lh-solid ttn" ++ textSize event.title 30) ]
                [ text event.title
                ]
            , div [ class "fw5 pv1 f4 flex items-center o-80 ttn" ]
                [ icon "at-sign", text event.venue.name ]
            ]


deltaTime : Maybe Date -> Maybe Date -> Maybe DeltaRecord
deltaTime now upcoming =
    Maybe.map2 Date.Extra.Duration.diff upcoming now


maybeEventDate : String -> Maybe Date
maybeEventDate date =
    (Result.toMaybe (Date.fromString date))


eventTime : SG.Event -> Maybe Date -> Html msg
eventTime event maybeNow =
    let
        fullDate x =
            (Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%A, %B %@e, %Y" x)

        clockTime x =
            (Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%-I:%M %P" x)

        eventDateView =
            case (maybeEventDate event.datetime_local) of
                Nothing ->
                    [ text "not sure what time this event is" ]

                Just x ->
                    [ div [ class "fw7 f3 lh-solid pb2" ] [ text (clockTime x) ]
                    , div [ class "fw4 f5 lh-solid" ] [ text (fullDate x) ]
                    ]
    in
        div [ class "pv4 mh4 bb b--white-20 flex justify-between" ]
            [ div [ class "mh1" ] (eventDateView)
            , eventTickets event
            ]


simpleTime : DeltaRecord -> Maybe Date -> String
simpleTime delta maybeEventDate =
    case maybeEventDate of
        Nothing ->
            "welp, I couldn't determine the date of the event"

        Just x ->
            if (String.contains "-" (toString delta)) then
                "happening now"
            else if (delta.year > 1) then
                "in over a year"
            else if (delta.year == 1) then
                "in a year"
            else if (delta.month > 1) then
                "in " ++ (monthName (month x))
            else if (delta.month == 1) then
                "next month"
            else if (delta.day > 13) then
                "in " ++ (toString (delta.day // 7)) ++ " weeks"
            else if (delta.day > 6) then
                "next " ++ (dayName (dayOfWeek x))
            else if (delta.day > 1) then
                somePartOfDay (hour x) (dayName (dayOfWeek x))
            else if (delta.day == 1) then
                somePartOfDay (hour x) (dayName (dayOfWeek x))
            else
                thisPartOfDay (hour x)


somePartOfDay : Int -> String -> String
somePartOfDay hour day =
    if (hour == 0) then
        day ++ " at midnight"
    else if (hour < 3) then
        day ++ " after midnight"
    else if (hour < 5) then
        day ++ " at dawn"
    else if (hour < 8) then
        "early " ++ day ++ " morning"
    else if (hour < 10) then
        day ++ " morning"
    else if (hour < 12) then
        "late " ++ day ++ " morning"
    else if (hour == 12) then
        day ++ " at noon"
    else if (hour < 15) then
        day ++ " afternoon"
    else if (hour < 17) then
        "late " ++ day ++ " afternoon"
    else if (hour < 20) then
        day ++ " evening"
    else if (hour < 23) then
        day ++ " night"
    else if (hour < 24) then
        "late " ++ day ++ " night"
    else
        "For some reason, I think there are more than 24 hours in a day."


thisPartOfDay : Int -> String
thisPartOfDay hour =
    if hour == 1 then
        "in an hour"
    else
        "in " ++ (toString hour) ++ " hours"


eventTickets : SG.Event -> Html msg
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
        case event.stats.lowest_price of
            Just x ->
                a [ href event.url, target "_blank", class "bg-white br1 pa2 mh1 flex items-center mh1 no-underline" ]
                    [ div
                        [ style [ ( "background-image", "url('Assets/SeatGeekLogo.svg')" ) ]
                        , class "h2 w2 mh1 contain bg-center"
                        ]
                        []
                    , div [ class "blue-80 mh2 f4 fw4 ttn" ] [ text ("$" ++ (toString x) ++ " tickets") ]
                    ]

            Nothing ->
                text ""


eventPopularity : SG.Event -> Html msg
eventPopularity event =
    case event.popularity of
        0.0 ->
            text ""

        _ ->
            div [ class "flex items-center mh4 pv4 bb b--white-20" ]
                [ div [ class "mr3 f2" ] [ text "🔥" ]
                , div [ class "flex flex-column flex-auto h2 justify-around" ]
                    [ progressBar event.popularity
                    , progressBar event.score
                    ]
                ]


yetToBeAdded : Html msg
yetToBeAdded =
    div [ class "flex items-center justify-around mh4 pv4 bb b--white-20 lh-copy" ]
        [ text """I still need to add genres in the emojis.
                I need to have photo galleries for extra photos,
                other events at the venue, other venues the artist will be at,
                spotify, Last.fm, and google maps integration. I also need to make
                events that do not have defined times do not display a time.

                Sed ut perspiciatis, unde omnis iste natus error sit voluptatem
                accusantium doloremque laudantium, totam rem aperiam eaque ipsa,
                quae ab illo inventore veritatis et quasi architecto beatae vitae
                dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit,
                aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,
                qui ratione voluptatem sequi nesciunt, neque porro quisquam est.
                qui dolorem ipsum, quia dolor sit amet consectetur adipisci.
                velit, sed quia non numquam [do] eius modi tempora inci[di]dunt,
                ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima
                veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam,
                nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure
                reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae
                consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?
                """
        ]


eventPool : Html msg
eventPool =
    div [ class "flex items-center justify-around mh4 pv4 bb b--white-20" ]
        [ a [ href "Pool.html", class "white link br-pill pa2 mh1 flex items-center mh1 grow" ]
            [ div [ Assets.feather "info", class "h2 w2 contain bg-center" ] []
            ]
        , a [ href "Pool.html", class "white link lg-breathe-50 br1 pa2 mh1 flex items-center mh1 grow" ]
            [ div [ Assets.feather "life-buoy", class "h2 w2 mh1 contain bg-center" ] []
            , div [ class "mh2 f4 fw4 ttn" ] [ text ("join pool") ]
            ]
        , div [ class "mr3 f2" ] [ text "🏊" ]
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
                div [ class "w-100 bg-black-20 overflow-hidden br-pill" ]
                    [ div [ style [ ( "width", ((toString percent) ++ "%") ) ], class "animated slideInleft pt2 bg-red-50" ] []
                    ]


eventIcons : SG.Event -> Html msg
eventIcons event =
    let
        toIcon x =
            li [ class "flex w4 flex-column items-center overflow-hidden pointer animated zoomIn" ]
                [ div [ class "f-subheadline f1-m grow" ] [ text (stringToEmoji (x.name)) ]
                , div [ class "pv2 o-80" ] [ text (Maybe.withDefault x.name (List.head (String.split "_" x.name))) ]
                ]
    in
        ul [ class "list mv0 mh4 ph0 pt4 pb3 flex justify-around items-center bb b--white-20" ]
            (List.map toIcon event.taxonomies)


randomGradient : SG.Event -> String
randomGradient event =
    let
        randomSeed =
            ((String.length event.title) * (String.length event.url))

        randomIndex =
            randomSeed % (List.length Assets.gradients)

        selectedGradient =
            List.head (List.drop randomIndex Assets.gradients)
    in
        case selectedGradient of
            Nothing ->
                ""

            Just result ->
                result ++ ""


eventBanner : SG.Event -> Html msg
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
            [ heroImg, class ("bg-center cover aspect-ratio aspect-ratio--16x9 bb b--white-20") ]
            [ div [ style [ ( "background-image", "linear-gradient( rgba(0,0,0,0.3), transparent)" ) ], class "aspect-ratio--object cover bg-center flex flex-column items-end justify-between pa4 pb0" ]
                [ discoverToolsView
                , div [ class "pa3 lg-breathe-50 br-pill relative top-2 right-1 flex grow justify-center items-center" ]
                    [ div [ Assets.feather "life-buoy", class "h3 w3 contain" ] []
                    ]
                ]
            ]


eventListView : Maybe Date -> SG.Event -> Html Msg
eventListView maybeNow event =
    let
        viewTime =
            case (deltaTime maybeNow (maybeEventDate event.datetime_local)) of
                Nothing ->
                    "whoopsie, viewTime messed up"

                Just x ->
                    simpleTime x (maybeEventDate event.datetime_local)

        atIcon =
            div
                [ Assets.feather "at-sign"
                , class "contain dib bg-center mr1 mt1 pb3 pr3"
                ]
                []

        cardImage =
            case (maybeImage event.performers) of
                Just image ->
                    div [ class ("w-100 mb2 mt1 " ++ (randomGradient event)) ]
                        [ div [ style [ ( "background-image", "url(" ++ image ++ ")" ) ], class "aspect-ratio--8x5 cover" ]
                            []
                        ]

                Nothing ->
                    text ""
    in
        div [ class "animated fadeInUp ph3 pt3 hover-bg-black-30", onClick (Types.ViewEvent (Just event.id)) ]
            [ cardImage
            , div [ class "pb3 bb b--white-20" ]
                [ div [ class "pb1 f4 pv2" ]
                    [ span [ class "mr2 fw5" ] [ text event.title ]
                    , div [ class "fw5 o-80 dib" ]
                        [ atIcon, text event.venue.name ]
                    ]
                , div [ class "pb2 flex justify-between items-center" ]
                    [ span [ class "fw4 o-60 ma0" ]
                        [ text viewTime ]
                    , ul [ class "pa0 ma0 list dib" ]
                        (List.map (\x -> li [ class "ml2 dib" ] [ text (stringToEmoji x.name) ]) event.taxonomies)
                    ]
                ]
            ]


maybeImage : List SG.Performer -> Maybe String
maybeImage performers =
    case (List.head performers) of
        Just performer ->
            performer.image

        Nothing ->
            Nothing


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


subscriptions : Types.Events -> Sub Msg
subscriptions model =
    Sub.none



-- HTTP
