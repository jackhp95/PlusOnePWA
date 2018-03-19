module Pages.Message.View exposing (..)

-- import Html.Events exposing (..)
-- import Pages.Message.Messages exposing (..)

import GraphCool.Scalar exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Moment exposing (..)
import Types exposing (..)


-- import Pages.Message.Model exposing (..)
-- VIEW


received : Message -> Html msg
received ms =
    div [ class "flex flex-auto pb3 pr5 slideInLeft animated" ]
        [ div [ class "measure-narrow bg-blue-50 br2 ph3 pv2" ]
            [ text ms.text ]
        , p [] [ text (getDateTime ms.createdAt) ]
        ]


sent : Message -> Html msg
sent ms =
    div [ class "flex justify-end flex-auto pb3 pl5 slideInRight animated" ]
        [ p [] [ text (getDateTime ms.createdAt) ]
        , div [ class "measure-narrow bg-black-50 br2 ph3 pv2" ]
            [ text ms.text ]
        ]


displayMessage : Message -> Html msg
displayMessage ms =
    case ms.from of
        Nothing ->
            received ms

        Just id ->
            if id == Id "cjed2224jh6a4019863siiw2e" then
                sent ms
            else
                received ms


toast : String -> Html msg
toast newText =
    div [ class "flex justify-center flex-auto pa4 fadeInUp animated" ]
        [ div [ class "measure-narrow tc" ]
            [ text newText ]
        ]
