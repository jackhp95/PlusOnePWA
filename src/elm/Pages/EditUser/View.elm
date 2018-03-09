module Pages.EditUser.View exposing (..)

import Assets exposing (bgImg, feather)
import GraphCool.Scalar exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Nav exposing (bar)
import Pages.EditUser.Messages exposing (..)
import Pages.EditUser.Update exposing (..)
import Pages.User.Model as UserModel exposing (..)


-- VIEW --


view : UserModel.UserModel -> Html Msg
view model =
    let
        user =
            model.user
    in
    div []
        [ text "Hello, World!"
        , text " bye"
        , br [] []
        , text "Name: "
        , input [ placeholder "name", onInput ChangeName, value user.name ] []
        , br [] []
        , text "Full Name: "
        , input [ placeholder "full name", onInput ChangeFullName, value (Maybe.withDefault "" user.nameFull) ] []
        , br [] []
        , text "Bio: "
        , input [ placeholder "bio", onInput ChangeBio, value (Maybe.withDefault "" user.bio) ] []
        , br [] []
        , text "Birthday"
        , input [ type_ "date", placeholder "birthday", onInput ChangeBirthday ] []
        , br [] []
        , text <| toString <| user.birthday
        , input [ type_ "Button", onClick SaveEdit, value "Save" ] []
        ]


genderSelect : (String -> Msg) -> Gender -> Html Msg
genderSelect msg currentGender =
    select [ onInput msg ]
        [ option [ value "Male" ] [ text "Male" ]
        , option [ value "Female", selected (toString currentGender == "Female") ] [ text "Female" ]
        ]
