-- http://package.elm-lang.org/packages/ccapndave/elm-update-extra/3.0.0/Update-Extra
-- http://package.elm-lang.org/packages/elm-lang/geolocation/1.0.2/Geolocation


module Location exposing (..)

import Geolocation as GPS exposing (Error(..), Location)
import Html exposing (Html)
import Task
import Update.Extra as Update


type alias Model =
    { location : Location
    , error : List String
    }


initModel : Model
initModel =
    Model (Location 0 0 0 Nothing Nothing 0) []


asErrorIn : Model -> String -> Model
asErrorIn model newError =
    { model | error = newError :: model.error }


type Msg
    = Geolocation Location
    | InitGeolocation (Result Error Location)


main : Program Never Model Msg
main =
    Html.program
        { init = initModel ! [ Task.attempt InitGeolocation GPS.now ]
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


matchGeolocationError : Error -> String
matchGeolocationError error =
    case error of
        PermissionDenied error_ ->
            "Permission denied " ++ error_

        LocationUnavailable error_ ->
            "Location unavailable " ++ error_

        Timeout error_ ->
            "Timeout " ++ error_


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Geolocation result ->
            Model result model.error
                |> Update.identity

        InitGeolocation result ->
            case result of
                Err error ->
                    error
                        |> matchGeolocationError
                        |> asErrorIn model
                        |> Update.identity

                Ok location ->
                    ( { model | location = location }, Cmd.none )


view : Model -> Html Msg
view x =
    Html.div []
        [ Html.div [] [ Html.text ("latitude: " ++ toString x.location.latitude) ]
        , Html.div [] [ Html.text ("longitude: " ++ toString x.location.longitude) ]
        , Html.div [] [ Html.text ("accuracy: " ++ toString x.location.accuracy) ]
        , Html.div [] [ Html.text ("altitude: " ++ toString x.location.altitude) ]
        , Html.div [] [ Html.text ("movement: " ++ toString x.location.movement) ]
        , Html.div [] [ Html.text ("timestamp: " ++ toString x.location.timestamp) ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ GPS.changes Geolocation ]
