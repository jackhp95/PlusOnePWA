module Pages.Pool.Model exposing (..)

import Mouse exposing (Position)
import Pages.Pool.Messages exposing (..)
import Pages.User.Model exposing (UserProfile)
import Window exposing (Size)
import GraphCool.Scalar exposing(..)
import RemoteData exposing (..)
import Graphqelm.Http exposing (..)

-- POOL --


type alias Pool =
    { id : Id
    , attending : Maybe (List UserProfile)
    }

type alias AttendResponse = 
    { attendingUserName : Maybe String
    , attendingEventPoolId : Maybe Id
    }

type alias AttendModel = 
    RemoteData Graphqelm.Http.Error (Maybe AttendResponse)

type alias PoolModel = 
    { pool : Pool
    , attendConfirm : AttendModel
    }

init : ( PoolModel, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : PoolModel
initModel =
    PoolModel
        initPool
        RemoteData.Loading

initPool : Pool
initPool =
    { id = Id "123"
    , attending = Nothing
    }

