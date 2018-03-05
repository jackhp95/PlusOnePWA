module View exposing (render)

-- DUCK TAPE --
-- PAGES --
-- SUBVIEWS --
-- SUBVIEWS --

import Auth0.Auth0 as Auth0
import Auth0.Authentication as Authentication
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Nav exposing (..)
import Pages.Chat.View as Chat
import Pages.Chats.View as Chats
import Pages.CreateEvent.View as CreateEvent
import Pages.EditUser.View as EditUser
import Pages.Event.View as Event
import Pages.Events.View as Events
import Pages.Pool.View as Pool
import Pages.User.View as User
import Proto exposing (..)
import Types


render : Types.Model -> Html Types.Msg
render model =
    Proto.bg
        [ div [ class "animated fadeIn f6 fw3 flex flex-column-l flex-row-m flex-column-reverse items-stretch vh-100 white" ]
            (Proto.plusOne
                ++ [ Nav.bar
                   , main_ [ class "flex-auto flex justify-stretch" ]
                        (page model)
                   ]
            )
        , div [ class "container" ]
            [ div [ class "jumbotron text-center" ]
                [ div []
                    (case Authentication.tryGetUserProfile model.me.authModel of
                        Nothing ->
                            [ p [] [ text "Please log in" ] ]

                        Just user ->
                            [ p [] [ text ("Hello, " ++ user.email ++ "! " ++ toString user.family_name) ]
                            , img [ src user.picture ] []
                            ]
                    )
                , div []
                    [ p [] [ text ("Hello, " ++ toString model.me.authModel.getUserId) ]
                    ]
                , p []
                    [ button
                        [ class "btn btn-primary"
                        , onClick
                            (Types.AuthenticationMsg
                                (if Authentication.isLoggedIn model.me.authModel then
                                    Authentication.LogOut
                                 else
                                    Authentication.ShowLogIn
                                )
                            )
                        ]
                        [ text
                            (if Authentication.isLoggedIn model.me.authModel then
                                "Log Out"
                             else
                                "Log In"
                            )
                        ]
                    ]
                ]
            ]
        ]



-- div
--     [ class "animated fadeIn f6 fw3 flex flex-column-l flex-row-m flex-column-reverse items-stretch vh-100 white" ]
--     [ Nav.bar
--     , main_ [ class "flex-auto flex justify-stretch" ]
--         (page model)
--     ]


page : Types.Model -> List (Html Types.Msg)
page model =
    case model.route of
        Types.GoChats chat ->
            case chat of
                Nothing ->
                    [ Chats.view model ]

                Just x ->
                    [ Chats.view model
                    , Chat.view model
                    ]

        Types.GoUser ->
            [ User.view model.me.user ]

        Types.GoPool ->
            [ Pool.view model.pool ]

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
                    , Event.view x model.events.currentDatetime
                    ]
