-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Pages.Events.View exposing (..)

-- import Pages.Event.Model exposing (Event, initEvent)
-- import Pages.Events.Model exposing (EventAPI(GraphCool, SeatGeek))
-- import SeatGeek.Query exposing (composeRequest)
-- import SeatGeek.Decode exposing (decodeReply)

import Assets exposing (feather)
import Date exposing (..)
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Moment exposing (..)
import RemoteData exposing (..)
import SeatGeek.Types as SG
import Types exposing (..)


-- HTTP
-- askQuery : SG.Query -> Cmd Msg
-- askQuery query =
--     let
--         url =
--             composeRequest query
--         request =
--             Http.get url decodeReply
--     in
--     Http.send Types.GetReply request
-- VIEW
-- eventAPItoListView : EventAPI -> Html Msg
-- eventAPItoListView api =
--     case api of
--         SeatGeek sgEvent ->
--             seatGeekListView sgEvent
--         GraphCool gcEvent ->
--             graphCoolListView gcEvent


view : Types.Model -> Html Msg
view model =
    let
        events =
            model.events

        mobileHide =
            case model.route of
                Types.GoEvents _ ->
                    " dn db-l "

                _ ->
                    ""

        -- -- Show the reponse of the "allEvents" query
        -- refineView a =
        --     let
        --         sortedEvents =
        --             sortListByDT (mergeLists a.events eventsUnlessError)
        --     in
        --     div [ class "bg-black-70" ]
        --         -- (List.map (\ b -> ul[ style [("background", "#000000")]][h4[][text b.name],p[][text (stringDateTime b.startsAt)]]) sortedEvents)
        --         (List.map graphCoolListView sortedEvents)
        -- -- Add a function to compare Datetime
        -- response =
        --     case events.eventResponse of
        --         NotAsked ->
        --             text "Hold up, Lemme Check"
        --         Loading ->
        --             text "Gimme a Sec"
        --         Failure e ->
        --             text ("Shucks um, " ++ Basics.toString e)
        --         Success a ->
        --             refineView a
    in
    section [ class ("animated fadeInUp w-100 w-auto-ns mw6-l overflow-auto z-999 flex-grow-1 shadow-2-l" ++ mobileHide) ]
        [ Html.header [ class "h5 flex flex-column justify-between pa3" ]
            [ Assets.discoverToolsView
            , div [ class "f2 lh-solid fw7 ma0 pa0" ]
                [ text "discover events" ]
            ]
        , section [ class "overflow-auto w-100 flex-grow-1 animated fadeInLeft mw6-l flex-shrink-0 bg-black-60 shadow-2-l" ] (List.map graphCoolListView events)
        ]



-- Convert SeatGeek Event into Database Event
-- Maybe convert SG.Venue to Database Venue too


convertEvent : Event -> SG.Event -> Event
convertEvent dbEvent sgEvent =
    { dbEvent | name = sgEvent.title, id = Id (Basics.toString sgEvent.id), startsAt = DateTime sgEvent.datetime_local }


convertList : List SG.Event -> List Event
convertList events =
    List.map (convertEvent initEvent) events



-- Merge Lists -- Append SeatGeek events to database event list


mergeLists : List Event -> List Event -> List Event
mergeLists list1 list2 =
    List.append list1 list2



-- Sort list by datetime


sortListByDT : List Event -> List Event
sortListByDT list =
    List.sortWith compareEventDateTime list



-- compareDateTime :
-- Use String.dropLeft, Date.fromString, Date.Extra.compare, List.sortWith


compareEventDateTime : Event -> Event -> Order
compareEventDateTime event1 event2 =
    let
        dt1 =
            event1.startsAt

        dt2 =
            event2.startsAt

        date1 =
            Date.fromString (stringDateTime dt1)
                |> Result.withDefault defaultDate

        date2 =
            Date.fromString (stringDateTime dt2)
                |> Result.withDefault defaultDate
    in
    compareDateTime date1 date2


graphCoolListView : Event -> Html Msg
graphCoolListView event =
    let
        datetime =
            case maybeEventDate (stringDateTime event.startsAt) of
                Nothing ->
                    "Unknown DateTime"

                Just dt ->
                    shortDate dt ++ " • " ++ clockTime dt

        atIcon =
            div
                [ Assets.feather "at-sign"
                , class "contain dib bg-center mr1 mt1 pb3 pr3"
                ]
                []
    in
    div
        [ class "animated fadeInUp ph3 pt3 ph4-m pt4-m hover-bg-black-30"
        , onClick (Types.RouteTo (GoEvents (Just <| .id initEvent)))
        ]
        [ div [ class "pb3 pb4-m bb b--white-20" ]
            [ div [ class "pb1 f5 f4-m pt3-m pt2" ]
                [ span [ class "mr2 fw5" ] [ text event.name ]
                , div [ class "fw5 o-80 dib" ]
                    [ atIcon, text "Location" ]
                ]
            , div [ class "pb2 flex justify-between items-center" ]
                [ span [ class "fw4 o-60 ma0" ] [ text datetime ]
                ]
            ]
        ]


seatGeekListView : SG.Event -> Html Msg
seatGeekListView event =
    let
        viewTime =
            case maybeEventDate event.datetime_local of
                Nothing ->
                    "not sure what time this event is"

                Just x ->
                    shortDate x ++ " • " ++ clockTime x

        atIcon =
            div
                [ Assets.feather "at-sign"
                , class "contain dib bg-center mr1 mt1 pb3 pr3"
                ]
                []

        cardImage =
            let
                seed =
                    String.length event.title * String.length event.url
            in
            case maybeImage event.performers of
                Just image ->
                    div [ class ("w-100 mb2 mt1 " ++ Assets.randomGradient seed) ]
                        [ div [ style [ ( "background-image", "url(" ++ image ++ ")" ) ], class "aspect-ratio--8x5 cover" ]
                            []
                        ]

                Nothing ->
                    text ""
    in
    div
        [ class "animated fadeInUp ph3 pt3 ph4-m pt4-m hover-bg-black-30"

        -- , onClick (Types.ViewEvent (Route.Events (Just <| SeatGeek event)))
        ]
        [ cardImage
        , div [ class "pb3 pb4-m bb b--white-20" ]
            [ div [ class "pb1 f5 f4-m pt3-m pt2" ]
                [ span [ class "mr2 fw5" ] [ text event.title ]
                , div [ class "fw5 o-80 dib" ]
                    [ atIcon, text event.venue.name ]
                ]
            , div [ class "pb2 flex justify-between items-center" ]
                [ span [ class "fw4 o-60 ma0" ]
                    [ text viewTime ]
                , ul [ class "pa0 ma0 list dib" ]
                    (List.map (\x -> li [ class "ml2 dib" ] [ text (Assets.stringToEmoji x.name) ]) event.taxonomies)
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



-- SUBSCRIPTIONS


subscriptions : Sub Msg
subscriptions =
    Sub.none
