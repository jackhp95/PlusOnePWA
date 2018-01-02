-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Pages.CreateEvent exposing (..)

import Types exposing (Msg, Events)
import SeatGeek.Query exposing (composeRequest)
import SeatGeek.Decode exposing (decodeReply)
import Nav exposing (bar)
import Assets exposing (feather, banner)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- VIEW


view : Types.Model -> Html Msg
view event =
    let
        sec title emoji =
            div [ class "flex items-center" ]
                [ div [ class "mr3 tc f2 w3" ] [ text emoji ]
                , fieldset [ class "flex flex-column flex-auto outline-0 bn pt3 ph0 ma0" ]
                    [ label [] [ text title ]
                    , input [ class "underline-hover f4 fw6 pv3 white bg-transparent bb bn outline-0 w-100", placeholder title ] []
                    ]
                ]
    in
        section [ class "animated fadeInUp flex flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ]
            [ Assets.banner "create event"
            , div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto" ]
                [ sec "Title" "📛"
                , sec "Description" "📢"
                , sec "Location" "⚓"
                , sec "Date" "📆"
                , sec "Time" "🕗"
                , sec "Privacy" "🔒"
                , sec "Taxonomy" "🏷️"
                ]
            ]
