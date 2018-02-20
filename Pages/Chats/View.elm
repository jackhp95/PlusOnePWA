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


module Pages.Chats.View exposing (..)

import Pages.Chat.View exposing (..)
import Assets exposing (..)
import Pages.User.View exposing (userAvi)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types
import TextArea exposing (auto)
import Assets exposing (..)
import Pages.Chat.Model as ChatModel


-- VIEW


view : Types.Model -> Html Types.Msg
view model =
    let
        chats =
            model.chats

        client =
            model.client

        mobileHide =
            case model.route of
                Types.GoChats (Just _) ->
                    " dn flex-l"

                _ ->
                    " flex "
    in
        section [ class ("animated fadeInUp flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ++ mobileHide) ]
            [ Assets.banner "chats"
            , div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto" ] (List.map nameBar chats)
            ]


nameBar : ChatModel.Chat -> Html Types.Msg
nameBar chat =
    div
        [ class "flex items-center z-2 fadeIn animated pa3 grow hover-bg-black-20 lh-title"
        , onClick (Types.ViewChat (Types.GoChats (Just chat)))
        ]
        [ div [ bgImg chat.userAvi, class "pa4 mh2 bg-white br-pill shadow-2 ba cover br-pill" ] []
        , div [ class "flex-auto mh2" ]
            [ div [ class "flex justify-between" ]
                [ div [ class "nowrap" ]
                    [ div [ class "f5 fw6" ] [ text "Hannah" ]
                    , div [ class "f5 fw4 o-60" ] [ text "Chance the Rapper" ]
                    ]
                , div [ class "mh2 self-start f7 tr o-80 flex-shrink-0" ]
                    [ div [] [ text "4:39pm" ]
                    , div [] [ text "unconfirmed" ]
                    ]
                ]
            , div [ class "f6 truncate pt2" ] [ text (Maybe.withDefault "" (List.head chat.messages)) ]
            ]
        ]
