module Pages.EditUser.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Nav exposing (bar)
import Assets exposing (feather, bgImg)
import Pages.User.Model exposing (..)
import Pages.User.Messages exposing (..)

import Pages.EditUser.Messages exposing (..)
import Pages.EditUser.Update exposing (..)
-- VIEW --


view : User -> Html Msg
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

