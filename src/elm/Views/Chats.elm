module Views.Chats exposing (..)

import Debug exposing (log)
import EveryDict exposing (..)
import GraphCool.Enum.DateState as DateState
import GraphCool.Scalar exposing (..)
import Helpers.Assets as Assets exposing (..)
import Helpers.From as From exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe.Extra exposing (..)
import Types exposing (..)


-- VIEW


view : Me -> Model -> Html Msg
view me model =
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
            List.map (nameBar model) (List.append me.initiated me.recipient)
    in
    section [ class ("animated fadeInUp flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ++ mobileHide) ]
        [ Assets.banner "chats"
        , div
            [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto" ]
            allChats
        ]


nameBar : Model -> Id -> Html Types.Msg
nameBar model chatId =
    let
        chat =
            case EveryDict.get chatId model.chats of
                Just chat ->
                    chat

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at chat"
                        initChat

        pool =
            case EveryDict.get chat.pool model.pools of
                Just pool ->
                    pool

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at pool"
                        initPool

        event =
            case EveryDict.get (Maybe.withDefault (Id "") pool.event) model.events of
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
            case EveryDict.get chat.initiated model.users of
                Just initiator ->
                    initiator

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at initiator"
                        initUser

        messages =
            Maybe.Extra.values <| List.map (\msgId -> EveryDict.get msgId model.messages) chat.messages

        mostRecentMessage =
            messages
                |> List.reverse
                |> List.head

        ( headMessage, headTime ) =
            case EveryDict.get chatId model.messages of
                Just message ->
                    ( message.text, "Draft" )

                Nothing ->
                    case mostRecentMessage of
                        Nothing ->
                            ( "No message yet. Say something.", "" )

                        Just message ->
                            ( message.text, dateTimeToViewClockTime message.createdAt )
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
