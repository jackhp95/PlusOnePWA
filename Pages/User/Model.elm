module Pages.User.Model exposing (..)
import Pages.User.Messages exposing (..)
import GraphCool.Scalar exposing (..)

type alias User =
    { auth0UserId: String
    , avi : List String
    , bio : String
    , birthday : DateTime
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
    , nameFull : String
    , passed : List String
    , password : String
    , proposed : List String
    , recipient : List String
    , sent : List String
    , updatedAt : String
    , gender : Gender
    , seekingGender : Gender
    }
type Gender
    = Male
    | Female    

init : ( User, Cmd Msg )
init =
    ( initModel, initCmd )

initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : User
initModel =
    User
        "11111"
        [ "https://images.unsplash.com/photo-1496361001419-80f0d1be777a?dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D" ]
        "look. life is bad. everyone's sad. we're all gonna die. but I already bought this inflatable bouncy castle, so are you gonna take your shoes off or what?"
        (DateTime "2017-01-13T09:00:00-05:00")
        "04/20/1970"
        []
        []
        "this@example.com"
        []
        []
        []
        []
        121
        []
        "Hannah Hazeldine"
        "Hannah Hazeldinanationator"
        []
        "thisismypass"
        []
        []
        []
        "04/20/1971"
        Male
        Male
