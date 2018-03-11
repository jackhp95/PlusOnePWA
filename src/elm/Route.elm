module Route exposing (Route(..), fromLocation, href, modifyUrl)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Navigation exposing (Location)
import UrlParser as Url exposing ((</>), Parser, oneOf, parseHash, s, string)


-- ROUTING --


type alias Id =
    String


type Route
    = Chats (Maybe Id)
    | User (Maybe Id)
    | Events (Maybe Id)
    | CreateEvent
    | Pool (Maybe Id)
    | EditUser Id


route : Parser (Route -> a) a
route =
    oneOf
        [ Url.map Chats (s "Chats" </> User.usernameParser)
        , Url.map User (s "User" </> User.usernameParser)
        , Url.map Events (s "Events" </> User.usernameParser)
        , Url.map CreateEvent (s "CreateEvent" </> User.usernameParser)
        , Url.map Pool (s "Events" </> User.usernameParser </> "Pool")
        , Url.map EditUser (s "User" </> User.usernameParser </> "Edit")
        ]



-- INTERNAL --


routeToString : Route -> String
routeToString page =
    let
        pieces =
            case page of
                Home ->
                    []

                Chats ->
                    [ "Chats" ]

                User ->
                    [ "User" ]

                Events ->
                    [ "Events" ]

                CreateEvent ->
                    [ "CreateEvent" ]

                Events slug ->
                    [ "Events", Article.slugToString slug ]

                User username ->
                    [ "User", User.usernameToString username ]
    in
    "#/" ++ String.join "/" pieces



-- PUBLIC HELPERS --


href : Route -> Attribute msg
href route =
    Attr.href (routeToString route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    routeToString >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        parseHash route location
