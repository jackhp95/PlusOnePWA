-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/web_sockets.html
-- ```Html.map ChatMsg (Chat.extra model)
-- ```
-- assuming you have something like
-- ```type Msg
--     = ChatMsg Chat.Msg
-- ```
-- You _could_ have all your messages in one file under `type Msg = ...` but if you are breaking things down into pages you should probably have page specific `Msg` types.
-- @Jack H. Peterson You could also make your views message type agnostic. https://medium.com/@matthew.buscemi/high-level-dependency-strategies-in-elm-1135ec877d49


module Chat exposing (..)

import Assets exposing (..)
import Profile exposing (profileAvi)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types


-- VIEW


viewMessage : String -> Html msg
viewMessage msg =
    div [ class "dib pa2 mv1 mh2 bg-light-blue br3 measure-narrow shadow-1" ] [ text msg ]


view : Types.Model -> Html msg
view x =
    let
        model =
            x.chat
    in
        div [ class "bg-black-70 flex flex-column flex-auto measure-wide pa0 ma0" ]
            [ nameBar model
            , section [ class "flex-auto lh-copy overflow-auto ph3 pt5 z-1 inner-shadow-1" ]
                ([ toast
                 , sent
                 , recieved
                 , sent
                 , recieved
                 , sent
                 , recieved
                 , sent
                 , recieved
                 , sent
                 , recieved
                 , sent
                 , recieved
                 , sent
                 , recieved
                 , sent
                 , recieved
                 , sent
                 , recieved
                 ]
                    ++ (List.map viewMessage (List.reverse model.messages))
                )
            , messageBar model.input
            ]


recieved : Html msg
recieved =
    div [ class "flex flex-auto pb3 pr5 slideInLeft animated" ]
        [ div [ class "measure-narrow bg-blue-50 br2 ph3 pv2" ]
            [ text "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?" ]
        ]


sent : Html msg
sent =
    div [ class "flex justify-end flex-auto pb3 pl5 slideInRight animated" ]
        [ div [ class "measure-narrow bg-black-50 br2 ph3 pv2" ]
            [ text "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?" ]
        ]


toast : Html msg
toast =
    div [ class "flex justify-center flex-auto pa4 fadeInUp animated" ]
        [ div [ class "measure-narrow tc" ]
            [ text "conversation initiated by hannah" ]
        ]


messageBar : String -> Html msg
messageBar x =
    div [ class "bg-black-40 flex h4 z-2 items-stretch overflow-hidden slideInUp animated" ]
        [ Html.textarea [ {- onInput Input, -} value x, rows 1, class "white bg-transparent items-center ma3 pa1 pb0 bn flex-auto outline-0", placeholder "Type Message" ]
            []
        , div [ class "bg-black-60 pa2 flex items-center hover-bg-blue grow" ]
            [ div [ {- onClick SendChatMessage, -} Assets.feather "chevron-right", class "w2 h2 contain" ] []
            ]
        ]


nameBar : Types.Chat -> Html msg
nameBar model =
    div [ class "bg-black-90 flex items-stretch absolute w-100 measure-wide z-2 h3 fadeIn animated" ]
        [ div [ class "flex items-center grow" ]
            [ div [ class "bounceIn animated h3 ph3 pt3 overflow-visible" ]
                [ div [ class "w3" ]
                    [ div [ bgImg model.userAvi, class "aspect-ratio--1x1 bg-white br-pill shadow-2 ba bw1 cover br-pill" ] []
                    ]
                ]
            , div [ class "f3 fw6" ] [ text "hannah" ]
            ]
        , div [ class "flex flex-auto justify-end items-center" ]
            [ div [ Assets.feather "more-vertical", class "grow pa3 pt2 contain mh2" ] []
            ]
        ]
