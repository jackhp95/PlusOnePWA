module TestGraphCool exposing (main)
import GraphCool.Enum.DateState exposing (DateState)
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
import Graphqelm.Operation exposing (RootQuery,RootMutation)
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import RemoteData exposing (..)
import GraphCool.Mutation as Mutation
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))

type alias Response =
    { event : Maybe Event }



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
    , usersAttending : Maybe (List Id)
    , usersLiked : Maybe (List Id)
    , usersViewed : Maybe (List Id)
    , venues : Maybe (List Id)
    }


mutation : SelectionSet Response RootMutation
mutation =
    Mutation.selection Response
        |> with (Mutation.createEvent
         (\optionals -> { optionals | nameFull = Present "Fun events", createdById = Present "cje07e7y7e227015745hh81m3" })
         { name = "Mizzou BasketBall NCAA Finals", startsAt = DateTime "2018-02-25T10:00:00.000Z" } event)



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
        |> with (Event.usersAttending identity userId)
        |> with (Event.usersLiked identity userId)
        |> with (Event.usersViewed identity userId)
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
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)


type Msg
    = GotResponse Model


type alias Model =
    RemoteData Graphqelm.Http.Error Response


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
                    div []
                        [
                         div []
                            [ h5 [] [ text "Events" ]
                            , div [] [ text (Basics.toString a.event) ]
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
        GotResponse response ->
            ( response, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
