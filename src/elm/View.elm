module View exposing (render)

import EveryDict exposing (..)
import Helpers.Find as Find exposing (..)
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
            case model.me of
                Nothing ->
                    [ The404.view <| "Weird, for some reason, we don't think you're logged in" :: model.errors ]

                Just me ->
                    case chatId of
                        Nothing ->
                            [ Chats.view me model ]

                        Just chatId ->
                            case EveryDict.get chatId model.chats of
                                Nothing ->
                                    [ Chats.view me model
                                    , The404.view <| "I can't find the chat!" :: model.errors
                                    ]

                                Just chat ->
                                    case maybeUserWithChatMeUsers chat me model.users of
                                        Nothing ->
                                            [ The404.view <| "I can't find who you're chatting with." :: model.errors ]

                                        Just with ->
                                            [ Chats.view me model
                                            , Chat.view
                                                chat
                                                with
                                                me
                                                model
                                            ]

        GoUser userId ->
            case EveryDict.get userId model.users of
                Just user ->
                    [ User.view user model ]

                Nothing ->
                    [ The404.view <| "I can't find this user!" :: model.errors ]

        GoPool pool ->
            [ Pool.view pool model ]

        GoEditMe ->
            [ EditMe.view model ]

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
                            [ The404.view <| "I can't find this event!" :: model.errors ]

        _ ->
            [ The404.view model.errors ]
