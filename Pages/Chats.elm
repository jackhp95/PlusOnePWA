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


module Pages.Chats exposing (..)

import Assets exposing (..)
import Pages.Profile exposing (profileAvi)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types
import TextArea exposing (auto)
import Assets exposing (..)


-- VIEW


view : Types.Model -> Html Types.Msg
view x =
    let
        chats =
            x.chats

        client =
            x.client
    in
        div [ class "flex flex-column items-stretch flex-auto measure pa0 ma0 shadow-2-l" ]
            [ banner
            , div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto" ] (List.map nameBar chats)
            ]


nameBar : Types.Chat -> Html Types.Msg
nameBar chat =
    div [ class "flex items-center z-2 fadeIn animated pa3 grow hover-bg-black-20 lh-title" ]
        [ div [ bgImg chat.userAvi, class "pa4 mh2 bg-white br-pill shadow-2 ba cover br-pill" ] []
        , div [ class "flex-auto mh2" ]
            [ div [ class "f5 fw6" ] [ text "Hannah" ]
            , div [ class "f5 fw4 o-60" ] [ text "Chance the Rapper" ]
            , div [ class "f6 truncate pt2" ] [ text (Maybe.withDefault "" (List.head chat.messages)) ]
            ]
        , div [ class "mh2 self-start f7 tr o-80" ]
            [ div [] [ text "4:39pm" ]
            , div [] [ text "unconfirmed" ]
            ]
        ]


banner : Html Types.Msg
banner =
    div
        [ class "w-100 pa3 flex flex-grow-1 flex-shrink-0 justify-between" ]
        [ div
            [ class "self-end f2 lh-solid fw7" ]
            [ text "chats" ]
        , div [ class "self-start" ] [ Assets.discoverToolsView ]
        ]
