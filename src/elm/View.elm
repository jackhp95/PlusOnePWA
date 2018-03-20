module View exposing (render)

import EveryDict exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Nav exposing (..)
import Pages.Chat as Chat
import Pages.Chats as Chats
import Pages.CreateEvent as CreateEvent
import Pages.EditMe as EditMe
import Pages.Event as Event
import Pages.Events as Events
import Pages.Pool as Pool
import Pages.User as User
import Types exposing (..)


render : Model -> Html Msg
render model =
    div
        [ class "animated fadeIn f6 fw3 flex flex-column-l flex-row-m flex-column-reverse items-stretch vh-100 white" ]
        [ Nav.bar model
        , main_ [ class "flex-auto flex justify-stretch" ]
            (page model)
        ]


page : Model -> List (Html Msg)
page model =
    let
        me =
            case model.me of
                Nothing ->
                    initMe

                Just me ->
                    me
    in
    case model.route of
        GoChats chatId ->
            case chatId of
                Nothing ->
                    [ Chats.view model ]

                Just chatId ->
                    let
                        chat =
                            Maybe.withDefault initChat <| EveryDict.get chatId model.chats
                    in
                    [ Chats.view model
                    , Chat.view chat me.id model
                    ]

        GoUser userId ->
            [ User.view userId model ]

        GoPool poolId ->
            case EveryDict.get poolId model.pools of
                Just pool ->
                    [ Pool.view pool model ]

                Nothing ->
                    [ text "I can't find the pool!" ]

        GoEditMe ->
            [ EditMe.view model ]

        GoCreateEvent ->
            [ CreateEvent.view model ]

        GoEvents event ->
            case event of
                Nothing ->
                    [ Events.view model ]

                Just x ->
                    [ Events.view model
                    , Event.view model
                    ]

        _ ->
            [ Events.view model ]
