module TestCreateMessage exposing (main)
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


-- type alias Event =
--     { chats : Maybe (List Id)
--     , createdAt : DateTime
--     , createdBy : Id
--     , endsAt : Maybe DateTime
--     , hosts : Maybe (List Id)
--     , id : Id
--     , name : String
--     , nameFull : Maybe String
--     , private : Bool
--     , startsAt : DateTime
--     , usersAttending : Maybe (List Id)
--     , usersLiked : Maybe (List Id)
--     , usersViewed : Maybe (List Id)
--     , venues : Maybe (List Id)
--     }


type alias Message =
    { chat : Id
    , createdAt : DateTime
    , from : Maybe Id
    , id : Id
    , text : String
    }

mutation : SelectionSet (Maybe Message) RootMutation
mutation =
    Mutation.selection identity -- (Maybe Event)
        |> with (Mutation.createMessage
         --identity
         (\optionals -> { optionals | chatId = Present (Id "cjd3n1uxs1uqc0148dt6739hl"), fromId = Present (Id "cjd15r1d1b3qh0123hjhf4r9c") })
         { text = "OMG! Can't believe I'm sending my first message!"} message)



-- event : SelectionSet Event GraphCool.Object.Event
-- event =
--     Event.selection Event
--         |> with (Event.chats identity chatId)
--         |> with Event.createdAt
--         |> with (Event.createdBy identity userId)
--         |> with Event.endsAt
--         |> with (Event.hosts identity hostId)
--         |> with Event.id
--         |> with Event.name
--         |> with Event.nameFull
--         |> with Event.private
--         |> with Event.startsAt
--         |> with (Event.usersAttending identity userId)
--         |> with (Event.usersLiked identity userId)
--         |> with (Event.usersViewed identity userId)
--         |> with (Event.venues identity venueId)

message : SelectionSet Message GraphCool.Object.Message
message =
    Message.selection Message
        |> with (Message.chat identity chatId)
        |> with Message.createdAt
        |> with (Message.from identity userId)
        |> with Message.id
        |> with Message.text

userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id

chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
    Chat.selection identity |> with Chat.id

makeRequest : Cmd Msg
makeRequest =
    mutation
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/OldPlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> MutateEvent)


type Msg
    = MutateEvent Model


type alias Model =
    RemoteData Graphqelm.Http.Error (Maybe Message)


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
                        div [][ text "Success. No response"]
                      Just m ->
                        div []
                        [
                         div []
                            [ h5 [] [ text "Message" ]
                            , div [] [ text "Text: ", text m.text ]
                            , div [] [ text "Created At: ", text (Basics.toString m.createdAt) ]
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
        MutateEvent response->
            ( response, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
