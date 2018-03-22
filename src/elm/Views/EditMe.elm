module Views.EditMe exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


-- VIEW --


view : Model -> Html Msg
view model =
    let
        me =
            model.forms.meForm
    in
    div []
        [ text "Hello, World!"
        , text " bye"
        , br [] []
        , text "Name: "
        , input [ onInput <| UpdateValue << MeName, value me.name ] []
        , br [] []
        , text "Full Name: "
        , input [ onInput <| UpdateValue << MeNameFull, value (Maybe.withDefault "" me.nameFull) ] []
        , br [] []
        , text "Bio: "
        , input [ onInput <| UpdateValue << MeBio, value (Maybe.withDefault "" me.bio) ] []
        , br [] []
        , text "Birthday"
        , input [ type_ "date", onInput <| UpdateValue << MeBirthday ] []
        , br [] []
        , text <| toString <| me.birthday
        , input [ type_ "Button", onClick <| UpdateValue MeSubmit, value "Save" ] []
        ]
