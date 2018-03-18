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
import Debug exposing (log)
import Dict exposing (..)
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


view : Chat -> Id -> Model -> Html Types.Msg
view chat meId model =
    let
        with =
            case meId == chat.initiated of
                True ->
                    -- True if Me is the initiator
                    Dict.get (toString chat.recipient) model.users
                        -- Fails if Client can't find User you're chatting with
                        |> Maybe.withDefault { initUser | name = "Finding User" }

                False ->
                    -- False if Me is the recipient
                    Dict.get (toString chat.initiated) model.users
                        -- Fails if Client doesn't have the User
                        |> Maybe.withDefault { initUser | name = "Loading User" }

        -- chat =
        --     case model.route of
        --         Types.GoChats id ->
        --             Dict.values model.chats
        --                 |> List.head
        --                 |> Maybe.withDefault initChat
        --         -- List.filter (id == ) (.id model.chats)
        --         _ ->
        --             initChat
        conversation =
            case chat.messages of
                Nothing ->
                    []

                Just msgs ->
                    List.map displayMessage msgs
    in
    div [ class "animated fadeInLeft bg-black-70 flex flex-column flex-auto measure-wide-l pa0 ma0 shadow-2-l" ]
        [ nameBar with
        , section [ class "flex-auto lh-copy overflow-auto ph3 pt5 z-1 inner-shadow-1" ]
            (toast ("conversation initiated by " ++ with.name) :: conversation)

        -- , text (Basics.toString model.createMessage.sendResponse)
        , messageBar model chat
        ]


messageBar : Types.Model -> Types.Chat -> Html Types.Msg
messageBar model chat =
    let
        -- Use the ChatId for the key of the message you're composing.
        -- This allows you to have mutliple different message states, not just one.
        -- Switching between chats should keep the message you're composing separate with this tactic.
        chatKey =
            toString chat.id

        composing =
            Maybe.withDefault initMessage <| Dict.get chatKey model.messages
    in
    div [ class "bg-black-40 flex flex-none z-2 items-stretch overflow-hidden pl2 slideInUp animated lh-copy" ]
        [ input
            [ class "white bg-transparent overflow-visible pa3 self-center flex-auto bn outline-0"
            , placeholder "strike up a convo"
            , autofocus True
            , value composing.text
            , onInput <| UpdateValue << MessageText chat.id
            ]
            []

        -- div
        -- , contenteditable True
        -- text composing.text
        , div [ class "bg-black-60 pa2 flex-none flex items-center hover-bg-blue grow" ]
            [ div
                [ Assets.feather "chevron-right"
                , class "w2 h2 contain"
                , onClick <| UpdateValue <| MessageSend chat.id
                ]
                []
            ]
        ]


nameBar : User -> Html Types.Msg
nameBar withUser =
    div [ class "bg-black-90 flex items-stretch absolute w-100 measure-wide-l z-2 h3 fadeIn animated" ]
        [ div
            [ class "flex items-center grow"
            , withUser.id
                |> Types.GoUser
                |> Types.RouteTo
                |> onClick
            ]
            [ div [ class "bounceIn animated h3 ph3 pt3 overflow-visible" ]
                [ div [ class "w3" ]
                    [ div
                        [ {--bgImg chat.userAvi --}
                          class "aspect-ratio--1x1 bg-white br-pill shadow-2 ba bw1 cover br-pill"
                        ]
                        []
                    ]
                ]
            , div [ class "f3 fw6" ] [ text withUser.name ]
            ]
        , div [ class "flex flex-auto justify-end items-center" ]
            [ div [ Assets.feather "more-vertical", class "grow pa3 pt2 contain mh2" ] []
            ]
        ]



-- HOLY SHIT THIS IS HACKY AS FUCK, IF YOU CAN THINK OF A BETTER WAY TO DO THIS PLEASE FIX THIS HELL
-- chattingWith : Chat -> Id -> Model -> User
-- chattingWith chat meId model =
--     case model.route of
--         GoChats maybeChatId ->
--             case maybeChatId of
--                 Just chatId ->
--                     case Dict.get (toString chatId) model.chats of
--                         Just chat ->
--                             case model.me of
--                                 Just me ->
--                                     case me.id == chat.initiated of
--                                         True ->
--                                             -- True if Me is the initiator
--                                             Dict.get (toString chat.recipient) model.users
--                                                 -- Fails if Client can't find User you're chatting with
--                                                 |> Maybe.withDefault { initUser | name = "Finding User" }
--                                         False ->
--                                             -- False if Me is the recipient
--                                             Dict.get (toString chat.initiated) model.users
--                                                 -- Fails if Client doesn't have the User
--                                                 |> Maybe.withDefault { initUser | name = "Loading User" }
--                                 Nothing ->
--                                     -- Fails if Me isn't authenticated
--                                     { initUser | name = "Please Sign In" }
--                         Nothing ->
--                             -- Fails if Client doesn't have the chat
--                             { initUser | name = "Unknown Chat" }
--                 Nothing ->
--                     -- Fails if the route is in GoChats, but Doesn't have a chatId
--                     { initUser | name = "Finding Chat" }
--         _ ->
--             -- Fails if route isn't a GoChat
--             { initUser | name = "Loading Chat" }
