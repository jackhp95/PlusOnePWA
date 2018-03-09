module TestGraphCool exposing (main)

import GraphCool.Enum.DateState exposing (DateState)
import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.Location as Location
import GraphCool.Object.Message as Message
import GraphCool.Object.User as User
import GraphCool.Object.Venue as Venue
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootMutation, RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import RemoteData exposing (..)


type alias Event =
    { chats : Maybe (List Id)
    , createdAt : DateTime
    , createdBy : Id
    , endsAt : Maybe DateTime
    , hosts : Maybe (List Id)
    , id : Id
    , name : String
    , nameFull : Maybe String
    , private : Bool
    , startsAt : DateTime
    , venues : Maybe (List Id)
    }


mutation : SelectionSet (Maybe Event) RootMutation
mutation =
    Mutation.selection identity
        -- (Maybe Event)
        |> with
            (Mutation.createEvent
                --identity
                (\optionals -> { optionals | createdById = Present (Id "cje07e7y7e227015745hh81m3") })
                { name = "Ed Sheeran Perfect Concert", startsAt = DateTime "2018-03-20T10:00:00.000Z" }
                event
            )


event : SelectionSet Event GraphCool.Object.Event
event =
    Event.selection Event
        |> with (Event.chats identity chatId)
        |> with Event.createdAt
        |> with (Event.createdBy identity userId)
        |> with Event.endsAt
        |> with (Event.hosts identity hostId)
        |> with Event.id
        |> with Event.name
        |> with Event.nameFull
        |> with Event.private
        |> with Event.startsAt
        |> with (Event.venues identity venueId)


chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
    Chat.selection identity |> with Chat.id


hostId : SelectionSet Id GraphCool.Object.Host
hostId =
    Host.selection identity |> with Host.id


venueId : SelectionSet Id GraphCool.Object.Venue
venueId =
    Venue.selection identity |> with Venue.id


userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id


makeRequest : Cmd Msg
makeRequest =
    mutation
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> MutateEvent)


type Msg
    = MutateEvent Model


type alias Model =
    RemoteData Graphqelm.Http.Error (Maybe Event)


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
                                    [ h5 [] [ text "Events" ]
                                    , div [] [ text "ID: ", text (Basics.toString e.id) ]
                                    , div [] [ text "Name: ", text (Basics.toString e.name) ]
                                    , div [] [ text "Full Name: ", text (Basics.toString e.nameFull) ]
                                    , div [] [ text "Start Date: ", text (Basics.toString e.startsAt) ]
                                    , div [] [ text "Created By: ", text (Basics.toString e.createdBy) ]
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
