module View exposing (render)

import EveryDict exposing (..)
import Helpers.From as From exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Views.Chat as Chat
import Views.Chats as Chats
import Views.CreateEvent as CreateEvent
import Views.EditMe as EditMe
import Views.Event as Event
import Views.Events as Events
import Views.Nav as Nav exposing (..)
import Views.Pool as Pool
import Views.The404 as The404 exposing (..)
import Views.User as User


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
    case model.route of
        GoChats chatId ->
            case chatId of
                Nothing ->
                    [ Chats.view model ]

                Just chatId ->
                    case model.me of
                        Just me ->
                            case EveryDict.get chatId model.chats of
                                Just chat ->
                                    if From.idToString me.id == From.idToString chat.initiated then
                                        -- True if Me is the initiator
                                        [ Chats.view model
                                        , Chat.view
                                            chat
                                            (EveryDict.get chat.recipient model.users
                                                -- Fails if Client can't find User you're chatting with
                                                |> Maybe.withDefault { initUser | name = "Finding User" }
                                            )
                                            model
                                        ]
                                    else if From.idToString me.id == From.idToString chat.recipient then
                                        -- False if Me is the recipient
                                        [ Chats.view model
                                        , Chat.view
                                            chat
                                            (EveryDict.get chat.initiated model.users
                                                -- Fails if Client doesn't have the User
                                                |> Maybe.withDefault { initUser | name = "Loading User" }
                                            )
                                            model
                                        ]
                                    else
                                        [ The404.view <| "Looks like you're not a part of this conversation?" :: model.errors ]

                                Nothing ->
                                    [ Chats.view model
                                    , text "I can't find the chat!"
                                    ]

                        Nothing ->
                            [ Chats.view model, text "Weird, for some reason, we don't think you're logged in" ]

        GoUser userId ->
            case EveryDict.get userId model.users of
                Just user ->
                    [ User.view user model ]

                Nothing ->
                    [ text "I can't find this user!" ]

        GoPool poolId ->
            case EveryDict.get poolId model.pools of
                Just pool ->
                    [ Pool.view pool model ]

                Nothing ->
                    [ text "I can't find the pool!" ]

        GoEditMe ->
            case model.me of
                Just me ->
                    [ EditMe.view model ]

                Nothing ->
                    [ text "Somehow you're not logged in, and you got to this page." ]

        GoCreateEvent ->
            [ CreateEvent.view model ]

        GoEvents eventId ->
            case eventId of
                Nothing ->
                    [ Events.view model ]

                Just eventId ->
                    case EveryDict.get eventId model.events of
                        Just event ->
                            [ Events.view model
                            , Event.view event model
                            ]

                        Nothing ->
                            [ text "I can't find this event!" ]

        _ ->
            [ The404.view model.errors ]
