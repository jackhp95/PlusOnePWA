module Pages.CreateEvent.View exposing (..)

-- import Pages.User.Model exposing (Me)
-- import Pages.CreateEvent.Messages exposing (..)
-- import Pages.CreateEvent.Model exposing (..)
-- import Pages.Events.Model exposing (Events)
-- import Auth0.Auth0 as Auth0
-- import Auth0.Authentication as Authentication
-- import RemoteData exposing (..)
-- import SeatGeek.Types as SG

import Assets exposing (banner, feather)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    let
        event =
            initEvent

        me =
            model.me

        textInput title emoji desc onChange =
            fieldset [ class "flex flex-column flex-auto outline-0 bn pa3 ma0 hide-child" ]
                [ label [ class "pb1" ] [ text (emoji ++ " " ++ title) ]
                , input [ class "f4 fw3 ma0 pv1 ph0 white bg-transparent bb bn outline-0 w-100", placeholder desc, onInput onChange ] []
                , div [ class "pt1 bt b--white child" ] []
                ]

        --
        -- timeInput title emoji desc =
        --     fieldset [ class "flex flex-column flex-auto outline-0 bn pa3 ma0 hide-child" ]
        --         [ label [ class "pb1" ] [ text (emoji ++ " " ++ title) ]
        --         , input [ type_ "time", class "f4 fw3 ma0 pa1 white bg-transparent bn outline-0", value "08:30" ] []
        --         , div [ class "pt1 bt b--white child" ] []
        --         ]
        dateInput title emoji desc onChange =
            fieldset [ class "flex flex-column flex-auto outline-0 bn pa3 ma0 hide-child" ]
                [ label [ class "pb1" ] [ text (emoji ++ " " ++ title) ]
                , input [ type_ "date", class "f4 fw3 ma0 pa1 white bg-transparent bn outline-0", onInput onChange ] []
                , div [ class "pt1 bt b--white child" ] []
                ]

        -- submitInput =
        --     div []
        --         [ input [ type_ "button" ] [ text "Submit" ]
        --         ]
        -- Show the reponse of the "allEvents" query
        -- refineView a =
        --     div []
        --         [ h3 [] [ text "Events" ]
        --         , div [] (List.map (\b -> ul [ style [ ( "background", "#eeeeee" ) ] ] [ h4 [] [ text b.name ], p [] [ text (Basics.toString b.id) ] ]) a.events)
        --         ]
        -- submission =
        --     case event.createdEvent of
        --         NotAsked ->
        --             text "Hold up, Lemme Check"
        --         Loading ->
        --             text "Gimme a Sec"
        --         Failure e ->
        --             text ("Shucks um, " ++ Basics.toString e)
        --         Success a ->
        --             case a of
        --                 Nothing ->
        --                     div [] [ text "Success. But NO response. Something went wrong" ]
        --                 Just e ->
        --                     div []
        --                         [ div []
        --                             [ h5 [] [ text "Event" ]
        --                             , div [] [ text "createdBy: ", text (Basics.toString e.createdBy) ]
        --                             , div [] [ text "Name: ", text (Basics.toString e.name) ]
        --                             , div [] [ text "Full Name: ", text (Basics.toString e.nameFull) ]
        --                             , div [] [ text "Start Date: ", text (Basics.toString e.startsAt) ]
        --                             , div [] [ text "Created By: ", text (Basics.toString e.createdBy) ]
        --                             ]
        --                         ]
    in
    div []
        [ section [ class "animated fadeInUp flex flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ]
            [ Assets.banner "create event"
            , div [ class " flex-grow-0 bg-black-70 overflow-auto pa3 white" ]
                -- flex-shrink-1
                [ textInput "Name" "📛" "what's it called?" (UpdateValue << EventName)
                , textInput "Full Name" "📢" "what's it for?" (UpdateValue << EventNameFull)
                , dateInput "Start Date" "📆" "what day is it?" (UpdateValue << EventStartDate)
                , dateInput "End Date" "📆" "what day is it?" (UpdateValue << EventEndDate)
                ]
            , button [ onClick <| UpdateValue EventSubmit ] [ text "Create An Event" ]
            ]
        , text (toString model.forms)
        ]
