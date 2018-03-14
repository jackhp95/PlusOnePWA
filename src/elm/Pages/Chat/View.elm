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

-- import Pages.User.View exposing (userAvi)
-- import TextArea exposing (auto)
-- import Pages.Chat.Model as ChatModel
-- import Pages.CreateMessage.Messages exposing (..)

import Assets exposing (..)
import GraphCool.Scalar exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Pages.Message.View exposing (..)
import Types exposing (..)


-- VIEW


viewMessage : String -> Html msg
viewMessage msg =
    div [ class "dib pa2 mv1 mh2 bg-light-blue br3 measure-narrow shadow-1" ] [ text msg ]


view : Types.Model -> Html Types.Msg
view model =
    let
        chat =
            case model.route of
                Types.GoChats id ->
                    Maybe.withDefault initChat <| List.head <| model.chats

                -- List.filter (id == ) (.id model.chats)
                _ ->
                    initChat

        conversation =
            case chat.messages of
                Nothing ->
                    []

                Just msgs ->
                    List.map displayMessage msgs
    in
    div [ class "animated fadeInLeft bg-black-70 flex flex-column flex-auto measure-wide-l pa0 ma0 shadow-2-l" ]
        [ nameBar chat
        , section [ class "flex-auto lh-copy overflow-auto ph3 pt5 z-1 inner-shadow-1" ]
            (toast ("conversation initiated by " ++ initiatedName chat) :: conversation)

        -- , text (Basics.toString model.createMessage.sendResponse)
        , messageBar model chat
        ]


messageBar : Types.Model -> Types.Chat -> Html Types.Msg
messageBar model chat =
    let
        content =
            initMessage.text
    in
    div [ class "bg-black-40 flex flex-none z-2 items-stretch overflow-hidden pl2 slideInUp animated" ]
        [ textarea
            [ class "white bg-transparent overflow-visible pa3 self-center flex-auto bn outline-0"
            , placeholder "strike up a convo"
            , autofocus True
            , value content
            ]
            []
        , div [ class "bg-black-60 pa2 flex items-center hover-bg-blue grow" ]
            [-- div [ onClick (Types.CreateMessageMsg SendMessage), Assets.feather "chevron-right", class "w2 h2 contain" ] []
            ]
        ]


initiatedName : Types.Chat -> String
initiatedName chat =
    if chat.initiated == Id "cjed2224jh6a4019863siiw2e" then
        "Me"
    else
        toString chat.initiated


crushName : Types.Chat -> String
crushName chat =
    if chat.initiated == Id "cjed2224jh6a4019863siiw2e" then
        case chat.recipient of
            Nothing ->
                "Anonymous"

            Just obj ->
                toString obj
    else
        toString chat.initiated


nameBar : Types.Chat -> Html Types.Msg
nameBar chat =
    div [ class "bg-black-90 flex items-stretch absolute w-100 measure-wide-l z-2 h3 fadeIn animated" ]
        [ div [ class "flex items-center grow", onClick (Types.RouteTo <| Types.GoUser (Just chat.id)) ]
            [ div [ class "bounceIn animated h3 ph3 pt3 overflow-visible" ]
                [ div [ class "w3" ]
                    [ div
                        [ {--bgImg chat.userAvi --}
                          class "aspect-ratio--1x1 bg-white br-pill shadow-2 ba bw1 cover br-pill"
                        ]
                        []
                    ]
                ]
            , div [ class "f3 fw6" ] [ text (crushName chat) ]
            ]
        , div [ class "flex flex-auto justify-end items-center" ]
            [ div [ Assets.feather "more-vertical", class "grow pa3 pt2 contain mh2" ] []
            ]
        ]
