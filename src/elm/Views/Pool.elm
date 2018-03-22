module Views.Pool exposing (..)

-- import Debug exposing (log)
-- import GraphCool.Scalar exposing (..)
-- import Maybe.Extra exposing (..)

import EveryDict exposing (..)
import Helpers.Assets as Assets exposing (bgImg, feather)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


-- VIEW


view : Pool -> Model -> Html Msg
view pool model =
    let
        allChats =
            div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto" ]
                (List.map (\user -> nameBar user model) <| List.map (\userId -> EveryDict.get userId model.users) pool.usersViewed)
    in
    section [ class "animated fadeInUp flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns flex" ]
        [ Assets.banner "pool"
        , allChats
        ]


nameBar : Maybe User -> Model -> Html Types.Msg
nameBar maybeUser model =
    -- let
    --     ( headMessage, headTime ) =
    --         case EveryDict.get user model.messages of
    --             Just message ->
    --                 ( message.text, "Draft" )
    --             Nothing ->
    --                 case mostRecentMessage of
    --                     Nothing ->
    --                         ( "No message yet. Say something.", "" )
    --                     Just message ->
    --                         ( message.text, "online" )
    -- in
    case maybeUser of
        Nothing ->
            text "aw beans, we have no idea who this dude is."

        Just user ->
            div
                [ class "flex items-center z-2 fadeIn animated pa3 grow hover-bg-black-20 lh-title"
                , user.id
                    |> GoUser
                    |> RouteTo
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
                            [ div [ class "f5 fw6" ] [ text user.name ]
                            , div [ class "f5 fw4 o-60" ]
                                [ text <| "titleOf event" ]
                            ]
                        , div [ class "mh2 self-start f7 tr o-80 flex-shrink-0" ]
                            [ div [] [ text "headTime" ] ]
                        ]
                    , div [ class "f6 truncate pt2" ] [ text <| Maybe.withDefault "No Bio Provided" user.bio ]
                    ]
                ]
