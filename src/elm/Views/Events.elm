module Views.Events exposing (..)

import Date exposing (..)
import EveryDict exposing (..)
import Helpers.Assets as Assets exposing (feather)
import Helpers.Compare as Compare exposing (..)
import Helpers.From as From exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import SeatGeek.Types as SG
import Types exposing (..)


view : Types.Model -> Html Msg
view model =
    let
        sortedListAPI =
            apiListSortByDateTime <| EveryDict.values events

        apiToListView api =
            case api of
                SeatGeek event ->
                    seatGeekListView event

                GraphCool event ->
                    graphCoolListView event

        events =
            model.events

        mobileHide =
            case model.route of
                Types.GoEvents _ ->
                    " dn db-l "

                _ ->
                    ""
    in
    section [ class ("animated fadeInUp w-100 w-auto-ns mw6-l overflow-auto z-999 flex-grow-1 shadow-2-l" ++ mobileHide) ]
        [ Html.header [ class "h5 flex flex-column justify-between pa3" ]
            [ Assets.discoverToolsView
            , div [ class "f2 lh-solid fw7 ma0 pa0" ]
                [ text "discover events" ]
            ]
        , section [ class "overflow-auto w-100 flex-grow-1 animated fadeInLeft mw6-l flex-shrink-0 bg-black-60 shadow-2-l" ] (List.map apiToListView sortedListAPI)
        ]


apiListSortByDateTime : List API -> List API
apiListSortByDateTime apiList =
    List.sortWith Compare.apiOnDate apiList


graphCoolListView : Event -> Html Msg
graphCoolListView event =
    let
        datetime =
            case Date.fromString (dateTimeToString event.startsAt) of
                Err _ ->
                    "Unknown DateTime"

                Ok dt ->
                    dateToViewShortDate dt ++ " • " ++ dateToViewClockTime dt

        atIcon =
            div
                [ Assets.feather "at-sign"
                , class "contain dib bg-center mr1 mt1 pb3 pr3"
                ]
                []
    in
    div
        [ class "animated fadeInUp ph3 pt3 ph4-m pt4-m hover-bg-black-30"
        , .id event
            |> Just
            |> GoEvents
            |> Types.RouteTo
            |> onClick
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
            case Date.fromString event.datetime_local of
                Err _ ->
                    "not sure what time this event is"

                Ok x ->
                    dateToViewShortDate x ++ " • " ++ dateToViewClockTime x

        atIcon =
            div
                [ Assets.feather "at-sign"
                , class "contain dib bg-center mr1 mt1 pb3 pr3"
                ]
                []

        cardImage =
            case List.head event.performers of
                Just performer ->
                    case performer.image of
                        Just image ->
                            div [ class "w-100 mb2 mt1" ]
                                [ div [ style [ ( "background-image", "url(" ++ image ++ ")" ) ], class "aspect-ratio--8x5 cover" ]
                                    []
                                ]

                        Nothing ->
                            text ""

                Nothing ->
                    text ""
    in
    div
        [ class "animated fadeInUp ph3 pt3 ph4-m pt4-m hover-bg-black-30"
        , event.id
            |> Just
            |> GoEvents
            |> Types.RouteTo
            |> onClick
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
