module View exposing (render)

-- DUCK TAPE --
-- PAGES --
-- SUBVIEWS --
-- SUBVIEWS --
-- import Html.Events exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Nav exposing (..)
import Pages.Chat.View as Chat
import Pages.Chats.View as Chats
import Pages.CreateEvent.View as CreateEvent
import Pages.EditUser.View as EditUser
import Pages.Event.View as Event
import Pages.Events.View as Events
import Pages.Pool.View as Pool
import Pages.User.View as User
import Types


render : Types.Model -> Html Types.Msg
render model =
    div
        [ class "animated fadeIn f6 fw3 flex flex-column-l flex-row-m flex-column-reverse items-stretch vh-100 white" ]
        [ Nav.bar model
        , main_ [ class "flex-auto flex justify-stretch" ]
            (page model)
        ]


page : Types.Model -> List (Html Types.Msg)
page model =
    case model.route of
        Types.GoChats chatModel ->
            case chatModel of
                Nothing ->
                    [ Chats.view model ]

                Just x ->
                    [ Chats.view model
                    , Chat.view model
                    ]

        Types.GoUser ->
            [ User.view model.me.user ]

        Types.GoPool ->
            [ Pool.view model ]

        Types.GoEditUser ->
            [ Html.map Types.EditUserMsg (EditUser.view model.me.user) ]

        Types.GoCreateEvent ->
            [ Html.map Types.CreateEventMsg (CreateEvent.view model.createEvent model.me) ]

        Types.GoEvents event ->
            case event of
                Nothing ->
                    [ Events.view model ]

                Just x ->
                    [ Events.view model
                    , Event.view x
                    ]

        _ ->
            [ Events.view model ]
