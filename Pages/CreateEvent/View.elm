module Pages.CreateEvent.View exposing (..)

import Types exposing (Msg)
import Pages.Events.Model exposing (Events)
import Nav exposing (bar)
import Assets exposing (feather, banner)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import RemoteData exposing (..)

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

       -- Show the reponse of the "allEvents" query
        refineView a =
        div [] [
             h3 [] [ text "Events" ]
            , div [] (List.map (\ b -> ul[ style [("background", "#eeeeee")]][h4[][text b.name],p[][text (Basics.toString b.id)]]) a.events)]

        response =
        case event.eventResponse of
            NotAsked -> text "Hold up, Lemme Check"
            Loading -> text "Gimme a Sec"
            Failure e -> text ("Shucks um, " ++ (Basics.toString e))
            Success a -> refineView a
    in
        section [ class "animated fadeInUp flex flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ]
            [ Assets.banner "create event"
            , div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto pa3 white" ]
                [ textInput "name" "📛" "what's it called?" ChangeName
                , textInput "nameFull" "📢" "what's it for?" ChangeNameFull
                , dateInput "startsAt" "📆" "what day is it?"
                , dateInput "endsAt" "📆" "what day is it?"
                ]
            , button [ onClick MakeRequest  ] [ text "Show Events" ]
            , div []
                [
                     h1 [] [ text "Response" ]
                    , h2 [] [ text "Raw" ]
                    , Html.text (Basics.toString event.eventResponse)
                    , h2 [] [ text "Refined" ]
                    , response
                ]
            ]
