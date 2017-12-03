-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Pages.Events exposing (..)

import Types exposing (Msg, Events)
import SeatGeek.Query exposing (composeRequest)
import SeatGeek.Decode exposing (decodeReply)
import SeatGeek.Types as SG
import Nav exposing (bar)
import Assets exposing (feather)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Task exposing (..)
import Date exposing (..)
import Moment exposing (..)


-- HTTP


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


view : Types.Model -> Html Msg
view model =
    let
        events =
            model.events

        mobileHide =
            case model.route of
                Types.GoEvents (Just _) ->
                    " dn db-l "

                _ ->
                    ""
    in
        section [ class ("animated fadeInUp w-100 mw6-l overflow-auto z-999 flex-grow-1 shadow-2-l" ++ mobileHide) ]
            [ div [ class "h5 flex flex-column justify-between pa3" ]
                [ Assets.discoverToolsView
                , div [ class "f1 f2-m lh-solid fw7 ma0 pa0" ]
                    [ text "discover events" ]
                ]
            , div [ class "bg-black-70" ] (List.map (eventListView events.currentDatetime) events.seatgeek.events)
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
            let
                seed =
                    ((String.length event.title) * (String.length event.url))
            in
                case (maybeImage event.performers) of
                    Just image ->
                        div [ class ("w-100 mb2 mt1 " ++ (Assets.randomGradient seed)) ]
                            [ div [ style [ ( "background-image", "url(" ++ image ++ ")" ) ], class "aspect-ratio--8x5 cover" ]
                                []
                            ]

                    Nothing ->
                        text ""
    in
        div
            [ class "animated fadeInUp ph3 pt3 hover-bg-black-30"
            , onClick (Types.ViewEvent (Types.GoEvents (Just event)))
            ]
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
                        (List.map (\x -> li [ class "ml2 dib" ] [ text (Assets.stringToEmoji x.name) ]) event.taxonomies)
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



-- SUBSCRIPTIONS


subscriptions : Sub Msg
subscriptions =
    Sub.none
