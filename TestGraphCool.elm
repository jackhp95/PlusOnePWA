module TestGraphCool exposing (main)

import GraphCool.Enum.DateState exposing (DateState)
import GraphCool.InputObject as IO exposing (..)
import GraphCool.Mutation as Mutation
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Host as Host
import GraphCool.Object.Location as Location
import GraphCool.Object.Message as Message
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as User
import GraphCool.Object.Venue as Venue
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import RemoteData exposing (..)


type alias Response =
    { hosts : List Host
    , venues : List Venue
    , locations : List Location
    , events : List Event
    , pools : List Pool
    , messages : List Message
    , chats : List Chat
    , users : List OtherUser
    }


type alias Host =
    { createdAt : DateTime
    , description : Maybe String
    , events : Maybe (List Event)
    , id : Id
    , name : String
    , nameFull : Maybe String
    , users : Maybe (List Id)
    , venues : Maybe (List Id)
    }


type alias Venue =
    { createdAt : DateTime
    , description : Maybe String
    , id : Id
    , name : String
    , nameFull : String
    }


type alias Location =
    { address : Maybe String
    , addressFull : Maybe String
    , city : Maybe String
    , country : Maybe String
    , createdAt : DateTime
    , id : Id
    , lat : Float
    , lon : Float
    , state : String
    , venue : Maybe Id
    , zip : Maybe String
    }


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


type alias Pool =
    { chats : Maybe (List Id)
    , event : Maybe Id
    , id : Id
    , seatGeekId : Maybe String
    , usersAttending : Maybe (List Id)
    , usersLiked : Maybe (List Id)
    , usersViewed : Maybe (List Id)
    }


type alias Message =
    { chat : Id
    , createdAt : DateTime
    , from : Maybe Id
    , id : Id
    , text : String
    }


type alias Chat =
    { canceled : Maybe Id
    , dateState : DateState
    , event : Id
    , id : Id
    , initiated : Id
    , messages : Maybe (List Message)
    , passed : Maybe Id
    , proposed : Maybe Id
    , recipient : Maybe Id
    }


type alias User =
    { auth0UserId : Maybe String
    , bio : Maybe String
    , birthday : DateTime
    , createdAt : DateTime
    , createdEvents : Maybe (List Id)
    , datesCanceled : Maybe (List Id)
    , email : Maybe String
    , attendingEvent : Maybe (List Id)
    , likedEvent : Maybe (List Id)
    , viewedEvent : Maybe (List Id)
    , hosts : Maybe (List Id)
    , id : Id
    , initiated : Maybe (List Id)
    , name : String
    , nameFull : Maybe String
    , passed : Maybe (List Id)
    , password : Maybe String
    , proposed : Maybe (List Id)
    , recipient : Maybe (List Id)
    , sent : Maybe (List Id)
    , updatedAt : DateTime
    }


type alias OtherUser =
    { bio : Maybe String
    , birthday : DateTime
    , id : Id
    }


queryEverything : SelectionSet Response RootQuery
queryEverything =
    Query.selection Response
        |> with (Query.allHosts identity host)
        |> with (Query.allVenues identity venue)
        |> with (Query.allLocations identity location)
        |> with (Query.allEvents identity event)
        |> with (Query.allPools identity pool)
        |> with (Query.allMessages identity message)
        |> with (Query.allChats identity chat)
        |> with (Query.allUsers identity otheruser)


mutation : SelectionSet (Maybe User) Graphqelm.Operation.RootMutation
mutation =
    Mutation.selection identity
        |> with (Mutation.createUser identity { birthday = DateTime "1969-06-09", name = "elm", authProvider = IO.AuthProviderSignupData { auth0 = Null, email = Present (IO.AuthProviderEmail { email = "elm@elm.org", password = "elm" }) } } user)


hostId : SelectionSet Id GraphCool.Object.Host
hostId =
    Host.selection identity |> with Host.id


host : SelectionSet Host GraphCool.Object.Host
host =
    Host.selection Host
        |> with Host.createdAt
        |> with Host.description
        |> with (Host.events identity event)
        |> with Host.id
        |> with Host.name
        |> with Host.nameFull
        |> with (Host.users identity userId)
        |> with (Host.venues identity venueId)


venueId : SelectionSet Id GraphCool.Object.Venue
venueId =
    Venue.selection identity |> with Venue.id


venue : SelectionSet Venue GraphCool.Object.Venue
venue =
    Venue.selection Venue
        |> with Venue.createdAt
        |> with Venue.description
        |> with Venue.id
        |> with Venue.name
        |> with Venue.nameFull


locationId : SelectionSet Id GraphCool.Object.Location
locationId =
    Location.selection identity |> with Location.id


location : SelectionSet Location GraphCool.Object.Location
location =
    Location.selection Location
        |> with Location.address
        |> with Location.addressFull
        |> with Location.city
        |> with Location.country
        |> with Location.createdAt
        |> with Location.id
        |> with Location.lat
        |> with Location.lon
        |> with Location.state
        |> with (Location.venue identity venueId)
        |> with Location.zip


eventId : SelectionSet Id GraphCool.Object.Event
eventId =
    Event.selection identity |> with Event.id


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


poolId : SelectionSet Id GraphCool.Object.Pool
poolId =
    Pool.selection identity |> with Pool.id


pool : SelectionSet Pool GraphCool.Object.Pool
pool =
    Pool.selection Pool
        |> with (Pool.chats identity chatId)
        |> with (Pool.event identity eventId)
        |> with Pool.id
        |> with Pool.seatGeekId
        |> with (Pool.attending identity userId)
        |> with (Pool.liked identity userId)
        |> with (Pool.viewed identity userId)


messageId : SelectionSet Id GraphCool.Object.Message
messageId =
    Message.selection identity
        |> with Message.id


message : SelectionSet Message GraphCool.Object.Message
message =
    Message.selection Message
        |> with (Message.chat identity chatId)
        |> with Message.createdAt
        |> with (Message.from identity userId)
        |> with Message.id
        |> with Message.text


chatId : SelectionSet Id GraphCool.Object.Chat
chatId =
    Chat.selection identity |> with Chat.id


chat : SelectionSet Chat GraphCool.Object.Chat
chat =
    Chat.selection Chat
        |> with (Chat.canceled identity userId)
        |> with Chat.dateState
        |> with (Chat.event identity eventId)
        |> with Chat.id
        |> with (Chat.initiated identity userId)
        |> with (Chat.messages identity message)
        |> with (Chat.passed identity userId)
        |> with (Chat.proposed identity userId)
        |> with (Chat.recipient identity userId)


userId : SelectionSet Id GraphCool.Object.User
userId =
    User.selection identity |> with User.id


user : SelectionSet User GraphCool.Object.User
user =
    User.selection User
        |> with User.auth0UserId
        |> with User.bio
        |> with User.birthday
        |> with User.createdAt
        |> with (User.createdEvents identity eventId)
        |> with (User.datesCanceled identity chatId)
        |> with User.email
        |> with (User.attendingEvent identity poolId)
        |> with (User.likedEvent identity poolId)
        |> with (User.viewedEvent identity poolId)
        |> with (User.hosts identity hostId)
        |> with User.id
        |> with (User.initiated identity chatId)
        |> with User.name
        |> with User.nameFull
        |> with (User.passed identity chatId)
        |> with User.password
        |> with (User.proposed identity chatId)
        |> with (User.recipient identity chatId)
        |> with (User.sent identity messageId)
        |> with User.updatedAt


otheruser : SelectionSet OtherUser GraphCool.Object.User
otheruser =
    User.selection OtherUser
        |> with User.bio
        |> with User.birthday
        |> with User.id


makeQueryRequest : Cmd Msg
makeQueryRequest =
    queryEverything
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)


makeMutationRequest : Cmd Msg
makeMutationRequest =
    mutation
        |> Graphqelm.Http.mutationRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> MutateUser)


type Msg
    = GotResponse (RemoteData Graphqelm.Http.Error Response)
    | MutateUser (RemoteData Graphqelm.Http.Error (Maybe User))


type alias Model =
    { query : RemoteData Graphqelm.Http.Error Response
    , mutation : RemoteData Graphqelm.Http.Error (Maybe User)
    }


init : ( Model, Cmd Msg )
init =
    ( Model RemoteData.Loading RemoteData.Loading
    , makeQueryRequest
      -- change this to MakeMutationRequest if you want to test a mutation.
    )


view : Model -> Html.Html Msg
view model =
    let
        response =
            case model.query of
                NotAsked ->
                    text "Hold up, Lemme Check"

                Loading ->
                    text "Gimme a Sec"

                Failure e ->
                    text ("Shucks um, " ++ Basics.toString e)

                Success a ->
                    div []
                        [ div []
                            [ h5 [] [ text "Host" ]
                            , div [] [ text (Basics.toString a.hosts) ]
                            ]
                        , div []
                            [ h5 [] [ text "Venues" ]
                            , div [] [ text (Basics.toString a.venues) ]
                            ]
                        , div []
                            [ h5 [] [ text "Locations" ]
                            , div [] [ text (Basics.toString a.locations) ]
                            ]
                        , div []
                            [ h5 [] [ text "Events" ]
                            , div [] [ text (Basics.toString a.events) ]
                            ]
                        , div []
                            [ h5 [] [ text "Messages" ]
                            , div [] [ text (Basics.toString a.messages) ]
                            ]
                        , div []
                            [ h5 [] [ text "Chats" ]
                            , div [] [ text (Basics.toString a.chats) ]
                            ]
                        , div []
                            [ h5 [] [ text "Users" ]
                            , div [] [ text (Basics.toString a.users) ]
                            ]
                        ]
    in
    div []
        [ div []
            [ h1 [] [ text "Generated Query" ]
            , pre [] [ text (Document.serializeQuery queryEverything) ]
            ]
        , div []
            [ h1 [] [ text "Generated Mutation" ]
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
            ( { model | query = response }, Cmd.none )

        MutateUser response ->
            ( { model | mutation = response }, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }