-- https://github.com/dillonkearns/graphqelm/blob/master/examples/src/Subscription.elm


module Subscription exposing (main)

import GraphCool.Object
import GraphCool.Object.User as User
import GraphCool.Object.UserSubscriptionPayload as UserSubscriptionPayload
import GraphCool.Scalar exposing (..)
import GraphCool.Subscription as Subscription
import Graphqelm.Document as Document
import Graphqelm.Field as Field
import Graphqelm.Operation exposing (RootSubscription)
import Graphqelm.SelectionSet as SelectionSet exposing (SelectionSet, with)
import Graphqelm.Subscription
import Graphqelm.Subscription.Protocol as Protocol
import Html exposing (Html, button, div, fieldset, h1, img, input, label, li, p, pre, text, ul)


-- import Json.Decode as Decode exposing (..)
-- import Json.Encode as Encode exposing (..)


subscriptionDocument : SelectionSet User RootSubscription
subscriptionDocument =
    Subscription.selection identity
        |> with (Subscription.user identity userNode |> Field.nonNullOrFail)


userNode : SelectionSet User GraphCool.Object.UserSubscriptionPayload
userNode =
    UserSubscriptionPayload.selection identity
        |> with (UserSubscriptionPayload.node user |> Field.nonNullOrFail)


type alias User =
    { bio : Maybe String
    , birthday : DateTime
    , createdAt : DateTime
    , id : Id
    , name : String
    , nameFull : Maybe String
    , updatedAt : DateTime
    }


userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id


user : SelectionSet User GraphCool.Object.User
user =
    User.selection User
        |> with User.bio
        |> with User.birthday
        |> with User.createdAt
        |> with User.id
        |> with User.name
        |> with User.nameFull
        |> with User.updatedAt


type alias Model =
    { data : List User
    , subscriptionStatus : Graphqelm.Subscription.Status
    , graphqlSubscriptionModel : Graphqelm.Subscription.Model Msg User
    }


type Msg
    = GraphqlSubscriptionMsg (Graphqelm.Subscription.Msg User)
    | SubscriptionDataReceived User
    | SubscriptionStatusChanged Graphqelm.Subscription.Status


init : ( Model, Cmd Msg )
init =
    let
        ( graphqlSubscriptionModel, graphqlSubscriptionCmd ) =
            Graphqelm.Subscription.init Protocol.phoenixAbsinthe socketUrl subscriptionDocument SubscriptionDataReceived
    in
    ( { data = []
      , subscriptionStatus = Graphqelm.Subscription.Uninitialized
      , graphqlSubscriptionModel =
            graphqlSubscriptionModel
                |> Graphqelm.Subscription.onStatusChanged SubscriptionStatusChanged
      }
    , graphqlSubscriptionCmd
    )


view : Model -> Html.Html Msg
view model =
    div []
        [ div []
            [ h1 [] [ text "Generated Subscription" ]
            , pre [] [ text (Document.serializeSubscription subscriptionDocument) ]
            ]
        , h1 [] [ text "User Activity" ]
        , text ("GraphCool Subscription connection status: " ++ toString model.subscriptionStatus)
        ]


socketUrl : String
socketUrl =
    "wss://subscriptions.graph.cool/v1/PlusOne"


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GraphqlSubscriptionMsg graphqlSubscriptionMsg ->
            let
                ( newModel, cmd ) =
                    Graphqelm.Subscription.update graphqlSubscriptionMsg model.graphqlSubscriptionModel
            in
            ( { model | graphqlSubscriptionModel = newModel }, cmd )

        SubscriptionDataReceived newData ->
            ( { model | data = newData :: model.data }, Cmd.none )

        SubscriptionStatusChanged newStatus ->
            ( { model | subscriptionStatus = newStatus }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Graphqelm.Subscription.listen GraphqlSubscriptionMsg model.graphqlSubscriptionModel


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- PROTOCOL
-- https://www.graph.cool/docs/reference/graphql-api/subscription-api-aip7oojeiv/#type-subscriptions
-- frameworkKnowledge : Protocol.Protocol subscriptionDecodesTo
-- frameworkKnowledge =
--     { initMessage =
--         Encode.string "graphql-subscriptions"
--     , heartBeatMessage =
--         Encode.list
--             [ Encode.null
--             , Encode.string "1"
--             , Encode.string "phoenix"
--             , Encode.string "heartbeat"
--             , Encode.object []
--             ]
--     , documentRequest =
--         \operation ->
--             Encode.list
--                 [ Encode.string "1"
--                 , Encode.string "1"
--                 , Encode.string "__absinthe__:control"
--                 , Encode.string "doc"
--                 , Encode.object [ ( "query", operation |> Encode.string ) ]
--                 ]
--     , subscriptionDecoder =
--         \decoder ->
--             subscriptionResponseDecoder
--                 (decoder
--                     |> Decode.field "result"
--                     |> Decode.index 4
--                 )
--     }
