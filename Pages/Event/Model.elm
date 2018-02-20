module Pages.Event.Model exposing (..)
import Pages.Event.Messages exposing (..)


type alias Event =
    { chats : List String
    , createAt : String
    , createdBy : String
    , endsAt : String
    , hosts : List String
    , id : Int
    , name : String
    , nameFull : String 
    , private : Bool
    , startsAt : String
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
        "10/10/10"
        "Alex"
        "10/12/10"
        []
        12345
        "name"
        "full Name"
        False
        "10/11/10"
        []
        []
        []
        []