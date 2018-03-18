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

-- import Pages.Chat.Model as ChatModel
-- import Pages.Chat.View exposing (..)
-- import Pages.User.View exposing (userAvi)

import Assets exposing (..)
import Debug exposing (log)
import Dict exposing (..)
import GraphCool.Enum.DateState as DateState
import GraphCool.Scalar exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Moment exposing (..)
import Types exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    let
        chats =
            model.chats

        mobileHide =
            case model.route of
                Types.GoChats (Just _) ->
                    " dn flex-l"

                _ ->
                    " flex "

        allChats =
            div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto" ] (List.map (nameBar model) (Dict.keys chats))
    in
    section [ class ("animated fadeInUp flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ++ mobileHide) ]
        [ Assets.banner "chats"
        , allChats
        ]



-- Ideally, this String value should be an Id value, because that's what it really is, but Dict won't allow for that.
-- Perhaps we can look into switching to all-dict, I'm not sure about the performance tho


nameBar : Model -> String -> Html Types.Msg
nameBar model chatKey =
    let
        chat =
            case Dict.get chatKey model.chats of
                Just chat ->
                    chat

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at chat"
                        initChat

        pool =
            case Dict.get (toString chat.pool) model.pools of
                Just pool ->
                    pool

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at pool"
                        initPool

        event =
            case Dict.get (toString (Maybe.withDefault (Id "") pool.event)) model.events of
                Just event ->
                    event

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at event"
                        (GraphCool initEvent)

        titleOf event =
            case event of
                SeatGeek event ->
                    event.title

                GraphCool event ->
                    event.name

        initiator =
            case Dict.get (toString chat.initiated) model.users of
                Just initiator ->
                    initiator

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at initiator"
                        initUser

        recipient =
            case Dict.get (toString chat.recipient) model.users of
                Just recipient ->
                    recipient

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at recipient"
                        initUser

        -- This sorting code is kinda bad, we should fix it.
        mostRecentMessage =
            Maybe.withDefault [] chat.messages
                |> List.reverse
                |> List.head

        ( headMessage, headTime ) =
            case Dict.get chatKey model.messages of
                Just message ->
                    ( message.text, "Draft" )

                Nothing ->
                    case mostRecentMessage of
                        Nothing ->
                            ( "No message yet. Say something.", "" )

                        Just message ->
                            ( message.text, getTime message.createdAt )
    in
    div
        [ class "flex items-center z-2 fadeIn animated pa3 grow hover-bg-black-20 lh-title"
        , chat.id
            |> Just
            |> Types.GoChats
            |> Types.RouteTo
            |> onClick
        ]
        [ div
            [ {--bgImg chat.userAvi--}
              class "pa4 mh2 bg-white br-pill shadow-2 ba cover br-pill"
            ]
            []
        , div [ class "flex-auto mh2" ]
            [ div [ class "flex justify-between" ]
                [ div [ class "nowrap" ]
                    [ div [ class "f5 fw6" ] [ text initiator.name ]
                    , div [ class "f5 fw4 o-60" ]
                        [ text <| titleOf event ]
                    ]
                , div [ class "mh2 self-start f7 tr o-80 flex-shrink-0" ]
                    [ div [] [ text headTime ]
                    , div [] [ text (DateState.toString chat.dateState) ]
                    ]
                ]
            , div [ class "f6 truncate pt2" ] [ text headMessage ]
            ]
        ]
