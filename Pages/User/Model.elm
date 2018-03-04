port module Pages.User.Model exposing (..)

import Pages.User.Messages exposing (..)
import Auth0.Auth0 as Auth0
import Auth0.Authentication as Authentication

-- Ports


port auth0authorize : Auth0.Options -> Cmd msg


port auth0authResult : (Auth0.RawAuthenticationResult -> msg) -> Sub msg


port auth0logout : () -> Cmd msg

-- User

type alias User =
    { auth0UserId : String
    , avi : List String
    , bio : String
    , birthday : String
    , createdAt : String
    , createdEvents : List String
    , datesCanceled : List String
    , email : String
    , eventsAttending : List String
    , eventsLiked : List String
    , eventsViewed : List String
    , hosts : List String
    , id : Int
    , initiated : List String
    , name : String
    , nameFull : Maybe String
    , passed : Maybe (List Id)
    , password : Maybe String
    , proposed : Maybe (List Id)
    , recipient : Maybe (List Id)
    , sent : Maybe (List Id)
    , updatedAt : DateTime
    }
type alias UserModel = 
    { user : User
    , userMutation : MutationModel
    }
type alias MutationModel =
    RemoteData Graphqelm.Http.Error (Maybe User)
type Gender
    = Male
    | Female    

<<<<<<< HEAD
init : ( UserModel, Cmd Msg )
=======
type alias Me =
    { user: User
    , authModel: Authentication.Model
    }

init : ( User, Cmd Msg )
>>>>>>> master
init =
    ( initModel, initCmd )

initMe :  Maybe Auth0.LoggedInUser -> Me
initMe initialAuthUser =
    Me
        initModel
        (Authentication.init auth0authorize auth0logout initialAuthUser)

initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : UserModel
initModel =
    UserModel
        initUser
        RemoteData.Loading

initUser : User
initUser =
    User
        (Just "11111")
        (Just "look. life is bad. everyone's sad. we're all gonna die. but I already bought this inflatable bouncy castle, so are you gonna take your shoes off or what?")
        (DateTime "2017-01-13T09:00:00-05:00")
        (DateTime "2017-01-13T09:00:00-05:00")
        Nothing
        Nothing
        (Just "this@example.com")
        Nothing
        Nothing
        Nothing
        Nothing
        (Id "1212")
        Nothing
        "Hannah Hazeldine"
        (Just "Hannah Hazeldinanationator")
        Nothing
        (Just "thisismypass")
        Nothing
        Nothing
        Nothing
        (DateTime "2017-01-13T09:00:00-05:00")