module Views.Chat exposing (..)

import EveryDict exposing (..)
import GraphCool.Scalar exposing (..)
import Helpers.Assets as Assets exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe.Extra
import Types exposing (..)
import Views.Message exposing (..)


-- VIEW


viewMessage : String -> Html msg
viewMessage msg =
    div [ class "dib pa2 mv1 mh2 bg-light-blue br3 measure-narrow shadow-1" ] [ text msg ]


view : Chat -> User -> Model -> Html Types.Msg
view chat with model =
    let
        conversation =
            List.map displayMessage <| Maybe.Extra.values <| List.map (\msgId -> EveryDict.get msgId model.messages) <| chat.messages
    in
    div [ class "animated fadeInLeft bg-black-70 flex flex-column flex-auto measure-wide-l pa0 ma0 shadow-2-l" ]
        [ nameBar with
        , section [ class "flex-auto lh-copy overflow-auto ph3 pt5 z-1 inner-shadow-1" ]
            (toast ("conversation initiated by " ++ with.name) :: conversation)
        , messageBar model chat
        ]


messageBar : Types.Model -> Types.Chat -> Html Types.Msg
messageBar model chat =
    let
        -- Use the ChatId for the key of the message you're composing.
        -- This allows you to have mutliple different message states, not just one.
        -- Switching between chats should keep the message you're composing separate with this tactic.
        composing =
            Maybe.withDefault initMessage <| EveryDict.get chat.id model.messages
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
