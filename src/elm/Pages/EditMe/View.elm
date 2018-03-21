module Pages.EditMe.View exposing (..)

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
        me =
            model.forms.me
    in
    div []
        [ text "Hello, World!"
        , text " bye"
        , br [] []
        , text "Name: "
        , input [ placeholder "name", onInput <| UpdateValue << MeName, value me.name ] []
        , br [] []
        , text "Full Name: "
        , input [ placeholder "full name", onInput <| UpdateValue << MeNameFull, value (Maybe.withDefault "" me.nameFull) ] []
        , br [] []
        , text "Bio: "
        , input [ placeholder "bio", onInput <| UpdateValue << MeBio, value (Maybe.withDefault "" me.bio) ] []
        , br [] []
        , text "Birthday"
        , input [ type_ "date", placeholder "birthday", onInput <| UpdateValue << MeBirthday ] []
        , br [] []
        , text <| toString <| me.birthday
        , input [ type_ "Button", onClick <| UpdateValue MeSubmit, value "Save" ] []
        ]



-- genderSelect : (String -> Msg) -> Gender -> Html Msg
-- genderSelect msg currentGender =
--     select [ onInput msg ]
--         [ option [ value "Male" ] [ text "Male" ]
--         , option [ value "Female", selected (toString currentGender == "Female") ] [ text "Female" ]
--         ]
