module Main exposing (main)

import Date exposing (..)
import String exposing (..)
import List exposing (..)
import Date.Extra.Format exposing (..)
import Date.Extra.Core exposing(monthToInt)
import Debug exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Http
import Json.Decode as Decode


type Gender
    = Male
    | Female


type alias User =
    { uniqueID : Int
    , name : Maybe String
    , nameFull : String
    , bio : String
    , birthday : Maybe Date
    , gender : Gender
    , seekingGender : Gender
    }


getUserBirthday : Maybe Date -> String
getUserBirthday user =
    case user of
        Nothing ->
            ""

        Just birthday ->
            isoDateString birthday


stringToGender : String -> Gender
stringToGender gender =
    case gender of
        "Male" ->
            Male

        "Female" ->
            Female

        _ ->
            Male

reformatDate : String -> String
reformatDate date =
    case String.split "-" date of
        [ year, month, day ] ->
            String.join "/" [ month, day, year ]
        _ ->
            ""

getUserBirthdayToDate : Maybe String -> Maybe Date
getUserBirthdayToDate user =
    case user of
        Nothing ->
            Result.toMaybe <| Date.fromString "1/8/1998"

        Just birthday ->
            log (reformatDate birthday)
            Result.toMaybe <| Date.fromString (reformatDate birthday)



-- INIT --


init : ( Model, Cmd Msg )
init =
    ( initModel, initCmd )



-- MODEL


type alias Model =
    { user : User
    , gifUrl: String
    }


initModel : Model
initModel = (
    Model initUser ""
    )

initUser : User
initUser =
    User
        0
        (Just "default")
        "def"
        "this is bio"
        (Result.toMaybe <| Date.fromString "01/08/1998")
        Female
        Female



initCmd : Cmd Msg
initCmd =
    Cmd.none



-- UPDATE --

postUser : User -> Cmd Msg
postUser user =
    let
        request =
            "https://media1.giphy.com/media/w7rUI7vQ90DgQ/giphy.gif"
    in
        Http.send NewGif (Http.get request (Decode.at ["data", "image_url"] Decode.string))

type Msg
    = ChangeName String
    | ChangeFullName String
    | ChangeBio String
    | ChangeBirthday String
    | ChangeGender String
    | ChangeSeekingGender String
    | SaveEdit
    | NewGif (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        user =
            model.user
    in
    case msg of
        ChangeName newName ->
            ( Model { user | name = Just newName } ""
            , Cmd.none
            )

        ChangeFullName newFullName ->
            ( Model { user | nameFull = newFullName } ""
            , Cmd.none
            )

        ChangeBio newBio ->
            ( Model { user | bio = newBio } ""
            , Cmd.none
            )

        ChangeBirthday newBirthday ->
            ( Model { user | birthday = getUserBirthdayToDate (Just newBirthday) } ""
            , Cmd.none
            )

        ChangeGender newGender ->
            ( Model { user | gender = stringToGender newGender } ""
            , Cmd.none
            )

        ChangeSeekingGender newSeekingGender ->
            ( Model { user | seekingGender = stringToGender newSeekingGender } ""
            , Cmd.none
            )
        SaveEdit ->
            ( model
            , postUser user
            )
        NewGif (Ok newUrl) ->
            ( { model | gifUrl = newUrl}
            , Cmd.none
            )
        NewGif (Err _) ->
            (model, Cmd.none)



-- VIEW --


view : Model -> Html Msg
view model =
    div []
        [ text "Hello, World!"
        , text " bye"
        , br [] []
        , text "Name: "
        , input [ placeholder "name", onInput ChangeName, value (Maybe.withDefault "" model.user.name) ] []
        , br [] []
        , text "Full Name: "
        , input [ placeholder "full name", onInput ChangeFullName, value model.user.nameFull ] []
        , br [] []
        , text "Bio: "
        , input [ placeholder "bio", onInput ChangeBio, value model.user.bio ] []
        , br [] []
        , text "Birthday"
        , input [ type_ "date", placeholder "birthday", onInput ChangeBirthday ] []
        , br [] []
        , text "Gender "
        , genderSelect ChangeGender model.user.gender
        , br [] []
        , text ("Looking for ")
        , genderSelect ChangeSeekingGender model.user.seekingGender
        , br [] []
        , text <| reformatDate <|getUserBirthday model.user.birthday
        ]


genderSelect : (String -> Msg) -> Gender -> Html Msg
genderSelect msg currentGender =
    select [ onInput msg ]
        [ option [ value "Male" ] [ text "Male" ]
        , option [ value "Female", selected ((toString currentGender) == "Female") ] [ text "Female" ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
