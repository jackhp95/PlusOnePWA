-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/web_sockets.html
-- ```Html.map ChatMsg (Chat.extra chat)
-- ```
-- assuming you have something like
-- ```type Msg
--     = ChatMsg Chat.Msg
-- ```
-- You _could_ have all your messages in one file under `type Msg = ...` but if you are breaking things down into pages you should probably have page specific `Msg` types.
-- @Jack H. Peterson You could also make your views message type agnostic. https://medium.com/@matthew.buscemi/high-level-dependency-strategies-in-elm-1135ec877d49


module Pages.Chat.View exposing (..)

import Assets exposing (..)
import Pages.User.View exposing (userAvi)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types
import TextArea exposing (auto)
import Pages.Chat.Model as ChatModel
import Pages.Message.View exposing (..)


-- VIEW


viewMessage : String -> Html msg
viewMessage msg =
    div [ class "dib pa2 mv1 mh2 bg-light-blue br3 measure-narrow shadow-1" ] [ text msg ]


view : Types.Model -> Html Types.Msg
view x =
    let
        chat =
            x.chat

        client =
            x.client
    in
        div [ class "animated fadeInLeft bg-black-70 flex flex-column flex-auto measure-wide-l pa0 ma0 shadow-2-l" ]
            [ nameBar chat
            , section [ class "flex-auto lh-copy overflow-auto ph3 pt5 z-1 inner-shadow-1" ]
                [ toast "conversation initiated by hannah"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , sent "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                , recieved "Woah, That's cool. This game seems pretty volitile when it comes to score. Is it stressful?"
                ]
            , messageBar chat client
            ]


messageBar : ChatModel.Chat -> Types.Client -> Html Types.Msg
messageBar chat client =
    div [ class "bg-black-40 flex flex-none z-2 items-stretch overflow-hidden pl2 slideInUp animated" ]
        [ textarea
            ((TextArea.auto client)
                ++ [ class "white bg-transparent overflow-visible pa3 self-center flex-auto bn outline-0"
                   , placeholder "strike up a convo"
                   , autofocus True
                   ]
            )
            []
        , div [ class "bg-black-60 pa2 flex items-center hover-bg-blue grow" ]
            [ div [ {- onClick SendChatMessage, -} Assets.feather "chevron-right", class "w2 h2 contain" ] []
            ]
        ]


nameBar : ChatModel.Chat -> Html Types.Msg
nameBar chat =
    div [ class "bg-black-90 flex items-stretch absolute w-100 measure-wide-l z-2 h3 fadeIn animated" ]
        [ div [ class "flex items-center grow", onClick (Types.ChangeTo Types.GoUser) ]
            [ div [ class "bounceIn animated h3 ph3 pt3 overflow-visible" ]
                [ div [ class "w3" ]
                    [ div [ bgImg chat.userAvi, class "aspect-ratio--1x1 bg-white br-pill shadow-2 ba bw1 cover br-pill" ] []
                    ]
                ]
            , div [ class "f3 fw6" ] [ text "hannah" ]
            ]
        , div [ class "flex flex-auto justify-end items-center" ]
            [ div [ Assets.feather "more-vertical", class "grow pa3 pt2 contain mh2" ] []
            ]
        ]
