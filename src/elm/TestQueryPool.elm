module TestGraphCool exposing (main)

import GraphCool.Object
import GraphCool.Object.Event as Event
import GraphCool.Object.Pool as Pool
import GraphCool.Object.User as User
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent, Null, Present))
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import Html.Attributes exposing (..)
import RemoteData exposing (..)


type alias Response =
    { pool : Maybe Pool
    }


type alias Pool =
    { event : Maybe Id
    , id : Id
    , seatGeekId : Maybe String
    , attending : Maybe (List User)
    , liked : Maybe (List User)
    , viewed : Maybe (List User)
    }


type alias User =
    { bio : Maybe String
    , birthday : DateTime
    , name : String
    , nameFull : Maybe String
    }


query : SelectionSet Response RootQuery
query =
    Query.selection Response
        |> with (Query.pool (\optionals -> { optionals | id = Present (Id "cjedb15btjs2m018425xmd99d") }) pool)


pool : SelectionSet Pool GraphCool.Object.Pool
pool =
    Pool.selection Pool
        |> with (Pool.event identity eventId)
        |> with Pool.id
        |> with Pool.seatGeekId
        |> with (Pool.attending identity user)
        |> with (Pool.liked identity user)
        |> with (Pool.viewed identity user)


user : SelectionSet User GraphCool.Object.User
user =
    User.selection User
        |> with User.bio
        |> with User.birthday
        |> with User.name
        |> with User.nameFull


eventId : SelectionSet Id GraphCool.Object.Event
eventId =
    Event.selection identity |> with Event.id


makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
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
        refineView pool =
            div []
                [ h3 [] [ text "Pool" ]
                , div [] [ text (Basics.toString pool.id) ]
                , div [] [ text (Basics.toString pool.event) ]
                , div [] [ text (Basics.toString pool.attending) ]
                ]

        response =
            case model of
                NotAsked ->
                    text "Hold up, Lemme Check"

                Loading ->
                    text "Gimme a Sec"

                Failure e ->
                    text ("Shucks um, " ++ Basics.toString e)

                Success a ->
                    case a.pool of
                        Nothing ->
                            text "Can't find such pool"

                        Just p ->
                            refineView p
    in
    div []
        [ div []
            [ h1 [] [ text "Generated Query" ]
            , pre [] [ text (Document.serializeQuery query) ]
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
