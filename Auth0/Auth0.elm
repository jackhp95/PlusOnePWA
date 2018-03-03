-- https://github.com/auth0-blog/elm-with-auth0
-- https://auth0.com/blog/creating-your-first-elm-app-part-2/
-- https://github.com/auth0-blog/elm-with-jwt-api


module Auth0.Auth0
    exposing
        ( AuthenticationError
        , AuthenticationResult
        , AuthenticationState(..)
        , LoggedInUser
        , Options
        , RawAuthenticationResult
        , Token
        , UserProfile
        , defaultOpts
        , mapResult
        )


type alias LoggedInUser =
    { profile : UserProfile
    , token : Token
    }


type AuthenticationState
    = LoggedOut
    | LoggedIn LoggedInUser


type alias Options =
    {}


type alias UserProfile =
    { email : String
    , email_verified : Bool
    , family_name: String
    , picture: String
    }


type alias Token =
    String


type alias AuthenticationError =
    { name : Maybe String
    , code : Maybe String
    , description : String
    , statusCode : Maybe Int
    }


type alias AuthenticationResult =
    Result AuthenticationError LoggedInUser


type alias RawAuthenticationResult =
    { err : Maybe AuthenticationError
    , ok : Maybe LoggedInUser
    }


mapResult : RawAuthenticationResult -> AuthenticationResult
mapResult result =
    case ( result.err, result.ok ) of
        ( Just msg, _ ) ->
            Err msg

        ( Nothing, Nothing ) ->
            Err { name = Nothing, code = Nothing, statusCode = Nothing, description = "No information was received from the authentication provider" }

        ( Nothing, Just user ) ->
            Ok user


defaultOpts : Options
defaultOpts =
    {}
