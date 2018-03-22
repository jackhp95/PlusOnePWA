module Views.Chat exposing (..)

-- import Helpers.KissDB as DB

import EveryDict exposing (..)
import GraphCool.Scalar exposing (..)
import Helpers.Assets as Assets exposing (..)
import Helpers.From as From exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe.Extra
import Types exposing (..)


-- VIEW


view : Chat -> User -> Me -> Model -> Html Types.Msg
view chat with me model =
    let
        conversation =
            chat.messages
                |> List.map (\messageId -> EveryDict.get messageId model.messages)
                |> Maybe.Extra.values
                |> List.map (\message -> displayMessage message me.id)
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
        maybeMessage =
            EveryDict.get chat.id model.messages

        submitOrRefresh =
            case maybeMessage of
                Nothing ->
                    div [ class "bg-black-60 pa2 flex-none flex items-center hover-bg-black grow" ]
                        [ div
                            [ Assets.feather "refresh-cw"
                            , class "w2 h2 contain"
                            , onClick <| UpdateValue <| MessageRefresh chat.id
                            ]
                            []
                        ]

                Just message ->
                    div [ class "bg-black-60 pa2 flex-none flex items-center hover-bg-blue grow" ]
                        [ div
                            [ Assets.feather "chevron-right"
                            , class "w2 h2 contain"
                            , onClick <| UpdateValue <| MessageSend chat.id message
                            ]
                            []
                        ]

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
        , submitOrRefresh
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


received : Message -> Html msg
received message =
    div [ class "flex flex-auto pb3 pr5 slideInLeft animated" ]
        [ div [ class "measure-narrow bg-blue-50 br2 ph3 pv2" ]
            [ text message.text ]
        , div [] [ text (dateTimeToViewShortDate message.createdAt) ]
        ]


sent : Message -> Html msg
sent message =
    div [ class "flex flex-row-reverse flex-auto pb3 pl5 slideInLeft animated" ]
        [ div [ class "measure-narrow bg-red-50 br2 ph3 pv2" ]
            [ text message.text ]
        , div [] [ text (dateTimeToViewShortDate message.createdAt) ]
        ]


displayMessage : Message -> Id -> Html msg
displayMessage message meId =
    if Nothing == message.from then
        toast message.text
    else if Just meId == message.from then
        sent message
    else
        received message


toast : String -> Html msg
toast newText =
    div [ class "flex justify-center flex-auto pa4 fadeInUp animated" ]
        [ div [ class "measure-narrow tc" ]
            [ text newText ]
        ]
