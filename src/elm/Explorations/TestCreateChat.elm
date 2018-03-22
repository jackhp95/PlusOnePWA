module TestCreateChat exposing (..)

import GraphCool.Enum.DateState exposing (DateState)
import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.User as User
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import RemoteData exposing (..)


type alias NewChat =
    { event : Id
    , initiated : String
    , recipient : Maybe String
    }


mutation : SelectionSet (Maybe NewChat) RootMutation
mutation =
    Mutation.selection identity
        |> with
            (Mutation.createChat
                (\optionals ->
                    { optionals
                        | eventId = Present (Id "cjedawr4dj83u0134tp12frhy")
                        , initiatedId = Present (Id "cjelx7wg22nqt0129luqv1v7t")
                        , recipientId = Present (Id "cjelx7vxz2n6w0199rj4na1a2")
                    }
                )
                newChat
            )


newChat : SelectionSet NewChat GraphCool.Object.Chat
newChat =
    Chat.selection NewChat
        |> with (Chat.event identity eventId)
        |> with (Chat.initiated identity userName)
        |> with (Chat.recipient identity userName)


userName : SelectionSet String GraphCool.Object.User
userName =
    User.selection identity |> with User.name


eventId : SelectionSet Id GraphCool.Object.Event
eventId =
    Event.selection identity |> with Event.id


makeRequest : Cmd Msg
makeRequest =
    mutation
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> MutateEvent)


type Msg
    = MutateEvent Model


type alias Model =
    RemoteData Graphqelm.Http.Error (Maybe NewChat)


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
                            div [] [ text "Oops. No response" ]

                        Just c ->
                            div []
                                [ div []
                                    [ h5 [] [ text "Successfully create a chat." ]
                                    , div [] [ text ("Initiator: " ++ c.initiated) ]
                                    , div [] [ text ("Recipient: " ++ Maybe.withDefault "NA" c.recipient) ]
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
