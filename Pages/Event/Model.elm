module Pages.Event.Model exposing (..)
import Pages.Event.Messages exposing (..)
import GraphCool.Scalar



type alias Event =
    { chats : List String
    , createAt : GraphCool.Scalar.DateTime
    , createdBy : String
    , endsAt : GraphCool.Scalar.DateTime
    , hosts : List String
    , id : GraphCool.Scalar.Id 
    , name : String
    , nameFull : String
    , private : Bool
    , startsAt : GraphCool.Scalar.DateTime
    , usersAttending : List String
    , usersLiked : List String
    , usersViewed : List String
    , venues : List String
    }

init : ( Event, Cmd Msg )
init =
    ( initModel, initCmd )

initCmd : Cmd Msg
initCmd =
    Cmd.none

initModel : Event
initModel =
    Event
        []
        (GraphCool.Scalar.DateTime "10/10/10")
        "Alex"
        (GraphCool.Scalar.DateTime "10/12/10")
        []
        (GraphCool.Scalar.Id "12345")
        "name"
        "full Name"
        False
        (GraphCool.Scalar.DateTime "10/11/10")
        []
        []
        []
        []
