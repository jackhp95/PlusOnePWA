module Pages.EditUser.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Nav exposing (bar)
import Assets exposing (feather, bgImg)
import Pages.User.Model exposing (..)

import Pages.EditUser.Messages exposing (..)
import Pages.EditUser.Update exposing (..)
import GraphCool.Scalar exposing (..)
-- VIEW --


view : User -> Html Msg
view model =
    div []
        [ text "Hello, World!"
        , text " bye"
        , br [] []
        , text "Name: "
        , input [ placeholder "name", onInput ChangeName, value model.name ] []
        , br [] []
        , text "Full Name: "
        , input [ placeholder "full name", onInput ChangeFullName, value model.nameFull ] []
        , br [] []
        , text "Bio: "
        , input [ placeholder "bio", onInput ChangeBio, value model.bio ] []
        , br [] []
        , text "Birthday"
        , input [ type_ "date", placeholder "birthday", onInput ChangeBirthday ] []
        , br [] []
        , text "Gender "
        , genderSelect ChangeGender model.gender
        , br [] []
        , text ("Looking for ")
        , genderSelect ChangeSeekingGender model.seekingGender
        , br [] []
        , text <| toString <| model.birthday
        ]


genderSelect : (String -> Msg) -> Gender -> Html Msg
genderSelect msg currentGender =
    select [ onInput msg ]
        [ option [ value "Male" ] [ text "Male" ]
        , option [ value "Female", selected ((toString currentGender) == "Female") ] [ text "Female" ]
        ]

