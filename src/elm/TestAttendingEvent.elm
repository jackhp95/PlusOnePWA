module TestAttendingEvent exposing (main)

import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.AddToAttendingEventPayload as AddToAttendingEventPayload
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as User
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import RemoteData exposing (..)


type alias AttendingEvent =
    { attendingUserName : Maybe String
    , attendingEventPoolId : Maybe Id
    }


mutation : SelectionSet (Maybe AttendingEvent) RootMutation
mutation =
    Mutation.selection identity
        -- (Maybe Event)
        |> with
            (Mutation.addToAttendingEvent
                --identity
                { attendingUserId = Id "cjdyzwxynmub701943xsjepmp", attendingEventPoolId = Id "cjedb15btjs2m018425xmd99d" }
                attendingEvent
            )


attendingEvent : SelectionSet AttendingEvent GraphCool.Object.AddToAttendingEventPayload
attendingEvent =
    AddToAttendingEventPayload.selection AttendingEvent
        |> with (AddToAttendingEventPayload.attendingUser userName)
        |> with (AddToAttendingEventPayload.attendingEventPool poolId)


type alias Pool =
    { chats : Maybe (List Id)
    , event : Maybe Id
    , id : Id
    , seatGeekId : Maybe String
    , usersAttending : Maybe (List Id)
    , usersLiked : Maybe (List Id)
    , usersViewed : Maybe (List Id)
    }


poolId : SelectionSet Id GraphCool.Object.Pool
poolId =
    Pool.selection identity |> with Pool.id


userName : SelectionSet String GraphCool.Object.User
userName =
    User.selection identity |> with User.name


makeRequest : Cmd Msg
makeRequest =
    mutation
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> MutateEvent)


type Msg
    = MutateEvent Model


type alias Model =
    RemoteData Graphqelm.Http.Error (Maybe AttendingEvent)


init : ( Model, Cmd Msg )
init =
    ( RemoteData.Loading
    , makeRequest
    )


view : Model -> Html.Html Msg
view model =
    let
        response =
            case model of
                NotAsked ->
                    text "Hold up, Lemme Check"

                Loading ->
                    text "Gimme a Sec"

                Failure e ->
                    text ("Shucks um, " ++ Basics.toString e)

                Success a ->
                    case a of
                        Nothing ->
                            div [] [ text "Success. No response" ]

                        Just e ->
                            div []
                                [ div []
                                    [ h5 [] [ text "AddingEventUsers" ]
                                    , div [] [ text "Name: ", text (Basics.toString e.attendingUserName) ]
                                    , div [] [ text "Pool Id: ", text (Basics.toString e.attendingEventPoolId) ]
                                    ]
                                ]
    in
    div []
        [ div []
            [ h1 [] [ text "Generated Query" ]
            , pre [] [ text (Document.serializeMutation mutation) ]
            ]
        , div []
            [ h1 [] [ text "Response" ]
            , h2 [] [ text "Raw" ]
            , Html.text (Basics.toString model)
            , h2 [] [ text "Refined" ]
            , response
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MutateEvent response ->
            ( response, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
