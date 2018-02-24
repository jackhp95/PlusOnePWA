module Pages.EditUser.Update exposing (..)

import Pages.User.Model exposing (..)
import Pages.EditUser.Messages exposing (..)

import Date exposing (..)
import String exposing (..)
import List exposing (..)
import Date.Extra.Format exposing (..)
import Date.Extra.Core exposing(monthToInt)

update : Msg -> User -> ( User, Cmd Msg )
update msg model =
    let
        user =
            model.user
    in
    case msg of
        ChangeName newName ->
            ( { model | name = Just newName }
            , Cmd.none
            )

        ChangeFullName newFullName ->
            ( { model | nameFull = newFullName }
            , Cmd.none
            )

        ChangeBio newBio ->
            ( { model | bio = newBio }
            , Cmd.none
            )

        ChangeBirthday newBirthday ->
            ( { model | birthday = getUserBirthdayToDate (Just newBirthday) }
            , Cmd.none
            )

        ChangeGender newGender ->
            ( { model | gender = stringToGender newGender }
            , Cmd.none
            )

        ChangeSeekingGender newSeekingGender ->
            ( { model | seekingGender = stringToGender newSeekingGender }
            , Cmd.none
            )

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
            Result.toMaybe <| Date.fromString (reformatDate birthday)