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
import Date.Extra.Format exposing (..)
import Date.Extra.Config.Config_en_us exposing (..)
import Date.Extra.I18n.I_en_us exposing (..)


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
-- tachyonsCSS : String
-- tachyonsCSS =
--     "https://unpkg.com/tachyons@4.8.0/css/tachyons.min.css"
-- plusOneCSS : String
-- plusOneCSS =
--     "Admin/plusOne.css"
-- animateCSS : String
-- animateCSS =
--     "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"


view : Model -> Html Msg
view model =
    div [ class "overflow-hidden animated fadeIn ttl" ]
        [ --Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href tachyonsCSS ] []
          --, Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href plusOneCSS ] []
          --, Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href animateCSS ] [],
          div [ class "white sans-serif flex fw1 vh-100 bg-black-60" ]
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
            [ class "animated bounceInLeft fw7 pa3-m f4 dib-l dn ttn" ]
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
        li [ class "animated zoomInLeft grow pr3-l pl4-l pv2-l mv2-l ph2 pointer hover-bg-black-50 z-999 flex flex-auto justify-center items-center br--right-l br-pill-l " ]
            [ div [ iconClasses, (featherIcon icon) ] []
            , div [ captionClasses ] [ text page ]
            ]


eventsView : Model -> Html Msg
eventsView model =
    section [ class "animated fadeInUp mw6-ns bg-black-40 overflow-auto z-999 shadow-2 mr3-l mr2-m flex-grow-1" ]
        [ div [ class "lg-breathe-50 h5 flex flex-column justify-between pa3" ]
            [ discoverToolsView
            , div [ class "f1 f2-m lh-solid fw8 ma0 pa0" ]
                [ text "discover events" ]
            ]
        , div [] (List.map (eventListView model.currentDatetime) model.seatgeek.events)
        ]


discoverToolsView : Html msg
discoverToolsView =
    let
        icon x =
            div [ class "animated bounceIn pointer hover-bg-black-50 br-pill pa2" ]
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
                section [ class "dn db-ns vh-100 animated overflow-auto fadeInLeft mw7-ns flex-grow-1 bg-black-20" ]
                    [ eventBanner event
                    , eventTitle event
                    , eventIcons event
                    , eventTime event now
                    , eventPool
                    , eventPopularity event
                    , yetToBeAdded
                    ]


eventTitle : Event -> Html msg
eventTitle event =
    let
        icon x =
            div [ featherIcon x, class "contain dib bg-center grow ml1 mr2 pt1 pb3 pl1 pr3" ] []

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
            [ div [ class ("fw7 pv1 lh-solid ttn" ++ textSize event.title 30) ]
                [ text event.title
                ]
            , div [ class "fw5 pv1 f4 flex items-start o-70 ttn" ]
                [ icon "at-sign", text event.venue.name ]
            ]


deltaTime : Maybe Date -> Maybe Date -> Maybe DeltaRecord
deltaTime now upcoming =
    Maybe.map2 Date.Extra.Duration.diff upcoming now


maybeEventDate : String -> Maybe Date
maybeEventDate date =
    (Result.toMaybe (Date.fromString date))


eventTime : Event -> Maybe Date -> Html msg
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
                    , div [ class "fw3 f5 lh-solid" ] [ text (fullDate x) ]
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
        case event.stats.lowest_price of
            Just x ->
                a [ href event.url, target "_blank", class "bg-white br1 pa2 mh1 flex items-center mh1 no-underline" ]
                    [ div
                        [ style [ ( "background-image", "url('Assets/SeatGeekLogo.svg')" ) ]
                        , class "h2 w2 mh1 contain bg-center"
                        ]
                        []
                    , div [ class "blue-80 mh2 f4 fw3 ttn" ] [ text ("$" ++ (toString x) ++ " tickets") ]
                    ]

            Nothing ->
                text ""


eventPopularity : Event -> Html msg
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
        [ a [ class "br-pill pa2 mh1 flex items-center mh1 grow" ]
            [ div [ featherIcon "info", class "h2 w2 contain bg-center" ] []
            ]
        , a [ class "lg-breathe-50 br1 pa2 mh1 flex items-center mh1 grow" ]
            [ div [ featherIcon "life-buoy", class "h2 w2 mh1 contain bg-center" ] []
            , div [ class "mh2 f4 fw3 ttn" ] [ text ("join pool") ]
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


eventIcons : Event -> Html msg
eventIcons event =
    let
        toIcon x =
            li [ class "flex w4 flex-column items-center overflow-hidden" ]
                [ div [ class "f-subheadline f1-m" ] [ text (stringToEmoji (x.name)) ]
                , div [ class "pv2 o-70" ] [ text (Maybe.withDefault x.name (List.head (String.split "_" x.name))) ]
                ]
    in
        ul [ class "list mv0 mh4 ph0 pt4 pb3 flex justify-around items-center bb b--white-20" ]
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
            [ heroImg, class ("bg-center cover aspect-ratio aspect-ratio--16x9 bb b--white-20") ]
            [ div [ style [ ( "background-image", "linear-gradient( rgba(0,0,0,0.3), transparent)" ) ], class "aspect-ratio--object cover bg-center flex flex-column items-end justify-between pa4 pb0" ]
                [ discoverToolsView
                , div [ class "pa3 bg-purple-80 br-pill relative top-2 right-2 shadow-2 flex grow justify-center items-center" ]
                    [ div [ featherIcon "life-buoy", class "h3 w3 contain" ] []
                    ]
                ]
            ]


eventListView : Maybe Date -> Event -> Html Msg
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
                [ featherIcon "at-sign"
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
        div [ class "animated fadeInUp ph3 pt3 hover-bg-black-30", onClick (ViewEvent (Just event.id)) ]
            [ cardImage
            , div [ class "pb3 bb b--white-20" ]
                [ div [ class "pb1 f4 pv2" ]
                    [ span [ class "mr2 fw6" ] [ text event.title ]
                    , div [ class "fw4 o-70 dib" ]
                        [ atIcon, text event.venue.name ]
                    ]
                , div [ class "pb2 flex justify-between items-center" ]
                    [ span [ class "fw2 o-50 ma0" ]
                        [ text viewTime ]
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
