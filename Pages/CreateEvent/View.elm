module Pages.CreateEvent.View exposing (..)

import Types exposing (Msg)
import Pages.Events.Model exposing (Events)
import Nav exposing (bar)
import Assets exposing (feather, banner)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import SeatGeek.Types as SG
import Pages.CreateEvent.Messages exposing (..)
import Pages.CreateEvent.Model exposing (..)


-- VIEW


view : Pages.CreateEvent.Model.CreateEvent -> Html Pages.CreateEvent.Messages.Msg
view event =
    let
        textInput title emoji desc onChange =
            fieldset [ class "flex flex-column flex-auto outline-0 bn pa3 ma0 hide-child" ]
                [ label [ class "pb1" ] [ text (emoji ++ " " ++ title) ]
                , input [ class "f4 fw3 ma0 pv1 ph0 white bg-transparent bb bn outline-0 w-100", placeholder desc, onInput onChange ] []
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
        submitInput =
            div []
              [ input [ type_ "button"] [ text "Submit" ]

              ]
    in
        section [ class "animated fadeInUp flex flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ]
            [ Assets.banner "create event"
            , div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto pa3 white" ]
                [ textInput "title" "📛" "what's it called?" ChangeTitle
                , textInput "description" "📢" "what's it for?" ChangeDescription
                , textInput "location" "⚓" "where's it at?" ChangeLocation
                , dateInput "date" "📆" "what day is it?"
                , timeInput "time" "🕒" "what time is it?"
                , text event.title
                , textInput "privacy" "🔒" "who's invited" ChangePrivacy
                , textInput "taxonomy" "🏷️" "what is it?" ChangeTaxonomy
                ]
            ]
