module TestGraphCool exposing (main)

import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import RemoteData exposing (..)
import Html.Attributes exposing (..)
import GraphCool.Object
import GraphCool.Object.User as User
import GraphCool.Object.Event as Event
import GraphCool.Query as Query
import GraphCool.Scalar

type alias Response =
    {
     events : List EventQuery
    }

type alias EventQuery =
    { startsAt : GraphCool.Scalar.DateTime
    , name : String
    , id : GraphCool.Scalar.Id
    }

query : SelectionSet Response RootQuery
query =
    Query.selection Response
        |> with (Query.allEvents event)


event : SelectionSet EventQuery GraphCool.Object.Event
event =
    Event.selection EventQuery
        |> with Event.startsAt
        |> with Event.name
        |> with Event.id



makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/OldPlusOne"
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
        refineView a =
        div [] [
             h3 [] [ text "Events" ]
            , div [] (List.map (\ b -> ul[ style [("background", "#eeeeee")]][h4[][text b.name],p[][text (Basics.toString b.id)]]) a.events)]

        response =
        case model of
            NotAsked -> text "Hold up, Lemme Check"
            Loading -> text "Gimme a Sec"
            Failure e -> text ("Shucks um, " ++ (Basics.toString e))
            Success a -> refineView a
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
