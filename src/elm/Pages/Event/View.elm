-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Pages.Event.View exposing (..)

-- import Date exposing (..)

import Assets exposing (feather)
import GraphCool.Scalar exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Moment exposing (..)
import Pages.Event.Model exposing (..)
import Pages.Events.Model exposing (EventAPI(GraphCool, SeatGeek))
import SeatGeek.Decode exposing (decodeReply)
import SeatGeek.Query exposing (composeRequest)
import SeatGeek.Types as SG
import Types exposing (Msg)


askQuery : SG.Query -> Cmd Msg
askQuery query =
    let
        url =
            composeRequest query

        request =
            Http.get url decodeReply
    in
    Http.send Types.GetReply request



-- VIEW


view : EventAPI -> Html Msg
view api =
    let
        apiToEvent api =
            case api of
                SeatGeek x ->
                    seatGeekView x

                GraphCool y ->
                    graphCoolView y
    in
    section [ class "overflow-auto w-100 flex-grow-1 animated fadeInLeft mw6-l flex-shrink-0 bg-black-70 shadow-2-l" ]
        (apiToEvent api)


graphCoolView : Event -> List (Html Msg)
graphCoolView event =
    [ -- eventBanner event
      eventName event.name

    -- , eventEmojis event
    -- , eventTime event.startsAt
    , eventPool

    -- , eventPopularity event
    -- , yetToBeAdded
    ]


seatGeekView : SG.Event -> List (Html Msg)
seatGeekView event =
    [ eventBanner event
    , eventName event.short_title
    , eventEmojis event

    -- , eventTime event.datetime_local
    , eventPool
    , eventPopularity event
    , yetToBeAdded
    ]


eventName : String -> Html Msg
eventName name =
    let
        icon x =
            div [ Assets.feather x, class "contain dib bg-center grow ml1 mr2 pt1 pb3 pl1 pr3" ] []
    in
    div [ class "pt4 pb3 mh4 bb b--white-20" ]
        [ div [ class "fw6 pv1 lh-solid ttn f3" ]
            [ text name
            ]
        , div [ class "fw5 pv1 f4 flex items-center o-80 ttn" ]
            [ icon "at-sign", text "Location" ]
        ]


eventTitle : SG.Event -> Html msg
eventTitle event =
    let
        icon x =
            div [ Assets.feather x, class "contain dib bg-center grow ml1 mr2 pt1 pb3 pl1 pr3" ] []
    in
    div [ class "pt4 pb3 mh4 bb b--white-20" ]
        [ div [ class "fw6 pv1 lh-solid ttn f3" ]
            [ text event.title
            ]
        , div [ class "fw5 pv1 f4 flex items-center o-80 ttn" ]
            [ icon "at-sign", text event.venue.name ]
        ]


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
                    [ style [ ( "background-image", "url('PUTURLHERE/SeatGeekLogo.svg')" ) ]
                    , class "h2 w2 mh1 contain bg-center"
                    ]
                    []
                , div [ class "blue-80 mh2 f4 fw4 ttn" ] [ text ("$" ++ toString x ++ " tickets") ]
                ]

        Nothing ->
            text ""



-- eventTime : Date -> Html msg
-- eventTime date =
--     let
--         viewDate =
--             case maybeEventDate date of
--                 Nothing ->
--                     "Unknown DateTime"
--                 Just dt ->
--                     shortDate dt
--         viewTime =
--             case maybeEventDate date of
--                 Nothing ->
--                     "Unknown DateTime"
--                 Just dt ->
--                     clockTime dt
--         eventDateView =
--             [ div [ class "fw7 f4 lh-solid pb1" ] [ text viewTime ]
--             , div [ class "fw4 lh-solid" ] [ text viewDate ]
--             ]
--     in
--     div [ class "pv4 mh4 bb b--white-20 flex justify-between" ]
--         [ div [ class "mh1 flex flex-column justify-center" ] eventDateView
--         --, eventTickets event
--         ]


stringDateTime : DateTime -> String
stringDateTime datetime =
    String.dropRight 1 (String.dropLeft 10 (Basics.toString datetime))


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


eventPool : Html Msg
eventPool =
    div [ class "flex items-center justify-around mh4 pv4 bb b--white-20" ]
        [ a [ href "Pool.html", class "white link br-pill pa2 mh1 flex items-center mh1 grow" ]
            [ div [ Assets.feather "info", class "h2 w2 contain bg-center" ] []
            ]
        , a
            [ onClick (Types.ChangeTo Types.GoPool)
            , class "white link lg-breathe-50 br1 pa2 mh1 flex items-center mh1 grow"
            ]
            [ div [ Assets.feather "life-buoy", class "h2 w2 mh1 contain bg-center" ] []
            , div [ class "mh2 f4 fw4 ttn" ] [ text "join pool" ]
            ]
        , div
            [ class "mr3 f2"
            , onClick (Types.ChangeTo Types.GoPool)
            ]
            [ text "🏊" ]
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
                [ div [ style [ ( "width", toString percent ++ "%" ) ], class "animated slideInleft pt2 bg-red-50" ] []
                ]


eventEmojis : SG.Event -> Html msg
eventEmojis event =
    let
        toIcon x =
            li [ class "flex w4 flex-column items-center overflow-hidden pointer animated zoomIn" ]
                [ div [ class "f1 grow" ] [ text (stringToEmoji x.name) ]
                , div [ class "pv2 o-80" ] [ text (Maybe.withDefault x.name (List.head (String.split "_" x.name))) ]
                ]
    in
    ul [ class "list mv0 mh4 ph0 pt4 pb3 flex justify-around items-center bb b--white-20" ]
        (List.map toIcon event.taxonomies)


eventBanner : SG.Event -> Html Msg
eventBanner event =
    let
        heroImg =
            case maybeImage event.performers of
                Nothing ->
                    let
                        seed =
                            String.length event.title * String.length event.url
                    in
                    class (Assets.randomGradient seed)

                Just image ->
                    style [ ( "background-image", "url(" ++ image ++ ")" ) ]
    in
    div
        [ heroImg, class "bg-center cover aspect-ratio aspect-ratio--16x9 bb b--white-20" ]
        [ div
            [ style [ ( "background-image", "linear-gradient( rgba(0,0,0,0.3), transparent)" ) ]
            , class "aspect-ratio--object cover bg-center flex flex-column items-end justify-between pa3"
            ]
            [ Assets.discoverToolsView
            , div [ class "pa3 lg-breathe-50 br-pill relative top-2 right-1 flex grow justify-center items-center" ]
                [ div
                    [ Assets.feather "life-buoy"
                    , onClick (Types.ChangeTo Types.GoPool)
                    , class "h3 w3 contain"
                    ]
                    []
                ]
            ]
        ]


maybeImage : List SG.Performer -> Maybe String
maybeImage performers =
    case List.head performers of
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
