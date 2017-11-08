module Main exposing (main)

import Char exposing (isDigit)
import Geolocation exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (all, length)
import Task exposing (..)


type alias Model =
    { geolocation : Result Geolocation.Error (Maybe Location)
    , zip : String
    , city : String
    , state : String
    , country : String
    , geoip : Bool
    }


initModel : Model
initModel =
    { geolocation = Ok Nothing
    , zip = ""
    , city = ""
    , state = ""
    , country = ""
    , geoip = True
    }


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


init : ( Model, Cmd Msg )
init =
    ( initModel
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- Geolocation.changes (UpdateGeolocation << Ok)


type Locator
    = Geolocation
    | Zip
    | City
    | State
    | Country
    | Geoip


type Msg
    = UpdateGeolocation (Result Geolocation.Error Location)
    | LocateThru Locator
    | UpdateZip String
    | UpdateCity String
    | UpdateState String
    | UpdateCountry String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LocateThru Geolocation ->
            ( model, Task.attempt UpdateGeolocation Geolocation.now )

        LocateThru Zip ->
            ( model, Cmd.none )

        LocateThru City ->
            ( model, Cmd.none )

        LocateThru State ->
            ( model, Cmd.none )

        LocateThru Country ->
            ( model, Cmd.none )

        LocateThru Geoip ->
            ( model, Cmd.none )

        UpdateGeolocation result ->
            ( { model | geolocation = Result.map Just result }
            , Cmd.none
            )

        UpdateZip result ->
            ( { model | zip = result }
            , Cmd.none
            )

        UpdateCity result ->
            ( { model | city = result }
            , Cmd.none
            )

        UpdateState result ->
            ( { model | state = result }
            , Cmd.none
            )

        UpdateCountry result ->
            ( { model | country = result }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div
        []
        [ h1
            []
            [ text "Where Am I?" ]
        , div
            []
            [ text (toString model) ]
        , button [ onClick (LocateThru Geolocation) ] [ text "use my gps" ]
        , div []
            [ input [ value model.zip, onInput UpdateZip ] []
            , button [ onClick (LocateThru Zip), disabled (validateZip model.zip) ] [ text "Find events at my Zip" ]
            ]
        , div []
            [ input [ value model.city, onInput UpdateCity ] []
            , button [ onClick (LocateThru City) ] [ text "Find events at my City" ]
            ]
        , div []
            [ input [ value model.state, onInput UpdateState ] []
            , button [ onClick (LocateThru State) ] [ text "Find events at my State" ]
            ]
        , div []
            [ input [ value model.country, onInput UpdateCountry ] []
            , button [ onClick (LocateThru Country) ] [ text "Find events at my Country" ]
            ]
        , button [ onClick (LocateThru Geoip) ] [ text "Find events at my guessed location" ]
        ]


validateZip : String -> Bool
validateZip zip =
    if
        String.isEmpty zip
            || not (all isDigit zip)
            || (not (String.length zip == 5) && not (String.length zip == 9))
    then
        True
    else
        False
