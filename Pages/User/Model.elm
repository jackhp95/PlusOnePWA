module Pages.User.Model exposing (..)

import Pages.User.Messages exposing (..)
import GraphCool.Scalar exposing (..)
import RemoteData exposing (..)
import Graphqelm.Http exposing (..)
import GraphCool.Scalar exposing (..)

type alias User =
    { auth0UserId : Maybe String
    , bio : Maybe String
    , birthday : DateTime
    , createdAt : DateTime
    , createdEvents : Maybe (List Id)
    , datesCanceled : Maybe (List Id)
    , email : Maybe String
    , eventsAttending : Maybe (List Id)
    , eventsLiked : Maybe (List Id)
    , eventsViewed : Maybe (List Id)
    , hosts : Maybe (List Id)
    , id : Id
    , initiated : Maybe (List Id)
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

init : ( UserModel, Cmd Msg )
init =
    ( initModel, initCmd )

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