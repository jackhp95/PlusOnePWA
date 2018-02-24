module Pages.CreateEvent.Model exposing (..)
import Pages.CreateEvent.Messages exposing (..)
import Pages.Event.Model exposing(Event)
import Date exposing (Date)
import Time exposing (Time)
import RemoteData exposing (..)

import Graphqelm.SelectionSet exposing (SelectionSet, with)
import GraphCool.Object.Event as Event
import GraphCool.Query as Query
import Graphqelm.Operation exposing (RootQuery)
import GraphCool.Object
import Graphqelm.Http exposing (..)


type alias CreateEvent =
    { title : String
    , description : String
    , location : String
    , date : String
    , time : String
    , privacy : String
    , taxonomy : String
    , eventResponse: ResponseModel
    }

query : SelectionSet Response RootQuery
query =
    Query.selection Response
        |> with (Query.allEvents event)

event : SelectionSet EventQuery GraphCool.Object.Event
event =
    Event.selection EventQuery
        -- |> with Event.chats
        -- |> with Event.createdAt
        -- |> with Event.createdBy
        -- |> with Event.endsAt
        -- |> with Event.hosts
        |> with Event.name
        |> with Event.id
        -- |> with Event.nameFull
        -- |> with Event.private
        -- |> with Event.startsAt
        -- |> with Event.usersAttending
        -- |> with Event.usersLiked
        -- |> with Event.usersViewed
        -- |> with Event.venues

-- { chats : List String
-- , createAt : GraphCool.Scalar.DateTime
-- , createdBy : String
-- , endsAt : GraphCool.Scalar.DateTime
-- , hosts : List String
-- , id : GraphCool.Scalar.Id
-- , name : String
-- , nameFull : String
-- , private : Bool
-- , startsAt : GraphCool.Scalar.DateTime
-- , usersAttending : List String
-- , usersLiked : List String
-- , usersViewed : List String
-- , venues : List String
-- }

makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)

init : ( CreateEvent, Cmd Msg )
init =
    ( initModel, makeRequest )

--initCmd : Cmd Msg
--initCmd =
--    Cmd.none

initModel : CreateEvent
initModel = (
    CreateEvent
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        RemoteData.Loading
    )
