module Pages.EditUser.View exposing (..)

-- import Assets exposing (bgImg, feather)
-- import GraphCool.Scalar exposing (..)
-- import Nav exposing (bar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


-- import Pages.EditUser.Messages exposing (..)
-- import Pages.EditUser.Update exposing (..)
-- import Pages.User.Model as UserModel exposing (..)
-- VIEW --


view : Model -> Html Msg
view model =
    let
        user =
            initUser
    in
    div []
        [ text "Hello, World!"
        , text " bye"
        , br [] []
        , text "Name: "
        , input [ placeholder "name", onInput <| UpdateValue << UserName, value user.name ] []
        , br [] []
        , text "Full Name: "
        , input [ placeholder "full name", onInput <| UpdateValue << UserFullName, value (Maybe.withDefault "" user.nameFull) ] []
        , br [] []
        , text "Bio: "
        , input [ placeholder "bio", onInput <| UpdateValue << UserBio, value (Maybe.withDefault "" user.bio) ] []
        , br [] []
        , text "Birthday"
        , input [ type_ "date", placeholder "birthday", onInput <| UpdateValue << UserBirthday ] []
        , br [] []
        , text <| toString <| user.birthday
        , input [ type_ "Button", onClick <| UpdateValue UserSubmit, value "Save" ] []
        ]



-- genderSelect : (String -> Msg) -> Gender -> Html Msg
-- genderSelect msg currentGender =
--     select [ onInput msg ]
--         [ option [ value "Male" ] [ text "Male" ]
--         , option [ value "Female", selected (toString currentGender == "Female") ] [ text "Female" ]
--         ]
