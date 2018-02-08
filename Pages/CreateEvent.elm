-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module Pages.CreateEvent exposing (..)

import Types exposing (Msg, Events)
import Nav exposing (bar)
import Assets exposing (feather, banner)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- VIEW


view : Types.Model -> Html Msg
view event =
    let
        textInput title emoji desc =
            fieldset [ class "flex flex-column flex-auto outline-0 bn pa3 ma0 hide-child" ]
                [ label [ class "pb1" ] [ text (emoji ++ " " ++ title) ]
                , input [ class "f4 fw3 ma0 pa1 white bg-transparent bb bn outline-0 w-100", placeholder desc ] []
                , div [ class "pt1 bt b--white child" ] []
                ]

        timeInput title emoji desc =
            fieldset [ class "flex flex-column flex-auto outline-0 bn pa3 ma0 hide-child" ]
                [ label [ class "pb1" ] [ text (emoji ++ " " ++ title) ]
                , input [ type_ "time", class "f4 fw3 ma0 pa1 white bg-transparent bn outline-0", value "08:30" ] []
                , div [ class "pt1 bt b--white child" ] []
                ]

        dateInput title emoji desc =
            fieldset [ class "flex flex-column flex-auto outline-0 bn pa3 ma0 hide-child" ]
                [ label [ class "pb1" ] [ text (emoji ++ " " ++ title) ]
                , input [ type_ "date", class "f4 fw3 ma0 pa1 white bg-transparent bn outline-0", value "2017-06-01" ] []
                , div [ class "pt1 bt b--white child" ] []
                ]
    in
        section [ class "animated fadeInUp flex flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ]
            [ Assets.banner "create event"
            , div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto pa3 white" ]
                [ textInput "title" "📛" "what's it called?"
                , textInput "description" "📢" "what's it for?"
                , textInput "location" "⚓" "where's it at?"
                , dateInput "date" "📆" "what day is it?"
                , timeInput "time" "🕒" "what time is it?"
                , textInput "privacy" "🔒" "who's invited"
                , textInput "taxonomy" "🏷️" "what is it?"
                ]
            ]
