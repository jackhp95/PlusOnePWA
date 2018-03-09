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

import Assets exposing (..)
import GraphCool.Enum.DateState as DateState
import GraphCool.Scalar exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Moment exposing (..)
import Pages.Chat.Model as ChatModel
import Pages.Chat.View exposing (..)
import Pages.User.View exposing (userAvi)
import RemoteData exposing (..)
import TextArea exposing (auto)
import Types


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
        response =
            case chats of
                NotAsked ->
                    text "Hold up, Lemme Check"

                Loading ->
                    text "Gimme a Sec"

                Failure e ->
                    text ("Shucks um, " ++ Basics.toString e)

                Success a ->
                    case a.user of
                        Nothing ->
                            text ""

                        Just user ->
                            let
                                initiated =
                                    case user.initiated of
                                        Nothing ->
                                            []

                                        Just chats ->
                                            chats

                                recipient =
                                    case user.recipient of
                                        Nothing ->
                                            []

                                        Just chats ->
                                            chats

                                list =
                                    initiated ++ recipient
                            in
                            div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto" ] (List.map nameBar list)
    in
    section [ class ("animated fadeInUp flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ++ mobileHide) ]
        [ Assets.banner "chats"
        , response
        ]


nameBar : ChatModel.Chat -> Html Types.Msg
nameBar chat =
    let
        messages =
            case chat.messages of
                Nothing ->
                    []

                Just ms ->
                    ms

        ( headMessage, headTime ) =
            case List.head (List.reverse messages) of
                Nothing ->
                    ( "No message yet. Say something.", "Unknow time" )

                Just m ->
                    case maybeEventDate (stringDateTime m.createdAt) of
                        Nothing ->
                            ( "No message yet. Say something.", "Unknow time" )

                        Just datetime ->
                            ( m.text, clockTime datetime )

        crushName =
            if chat.initiated.id == Id "cjed2224jh6a4019863siiw2e" then
                case chat.recipient of
                    Nothing ->
                        "Anonymous"

                    Just obj ->
                        obj.name
            else
                chat.initiated.name
    in
    div
        [ class "flex items-center z-2 fadeIn animated pa3 grow hover-bg-black-20 lh-title"
        , onClick (Types.ViewChat (Types.GoChats (Just chat)))
        ]
        [ div
            [ {--bgImg chat.userAvi--}
              class "pa4 mh2 bg-white br-pill shadow-2 ba cover br-pill"
            ]
            []
        , div [ class "flex-auto mh2" ]
            [ div [ class "flex justify-between" ]
                [ div [ class "nowrap" ]
                    [ div [ class "f5 fw6" ] [ text crushName ]
                    , div [ class "f5 fw4 o-60" ] [ text chat.event ]
                    ]
                , div [ class "mh2 self-start f7 tr o-80 flex-shrink-0" ]
                    [ div [] [ text headTime ]
                    , div [] [ text (DateState.toString chat.dateState) ]
                    ]
                ]
            , div [ class "f6 truncate pt2" ] [ text headMessage ]
            ]
        ]
