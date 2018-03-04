module Pages.Message.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Pages.Message.Messages exposing (..)
import Pages.Message.Model exposing (..)


-- VIEW


recieved : String -> Html msg
recieved newText =
    div [ class "flex flex-auto pb3 pr5 slideInLeft animated" ]
        [ div [ class "measure-narrow bg-blue-50 br2 ph3 pv2" ]
            [ text "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?" ]
        ]


sent : String -> Html msg
sent newText =
    div [ class "flex justify-end flex-auto pb3 pl5 slideInRight animated" ]
        [ div [ class "measure-narrow bg-black-50 br2 ph3 pv2" ]
            [ text newText ]
        ]


toast : String -> Html msg
toast newText =
    div [ class "flex justify-center flex-auto pa4 fadeInUp animated" ]
        [ div [ class "measure-narrow tc" ]
            [ text newText ]
        ]
