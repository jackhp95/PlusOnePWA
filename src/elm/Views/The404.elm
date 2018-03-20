module Views.The404 exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- VIEW


view : List String -> Html msg
view errors =
    let
        viewError error =
            div [ class "pa2" ] [ text <| toString error ]

        viewErrors =
            List.map viewError <| errors
    in
    div [ class "flex-auto self-stretch flex flex-column items-center justify-center" ]
        [ div [ class "pa3 fw9 f-headline-l f-sub-headline-m f1" ] [ text "404" ]
        , div [ class "pa3 f4-l f5-m f6" ] [ text "Whoops, This page doesn't exist" ]
        , div [] viewErrors
        ]
