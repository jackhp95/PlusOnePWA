module Pages.Pool.Model exposing (..)

import Mouse exposing (Position)
import Pages.Pool.Messages exposing (..)
import Pages.User.Model exposing (UserProfile)
import Window exposing (Size)
import GraphCool.Scalar exposing(..)


-- POOL --


type alias Pool =
    { id : Id
    , attending : Maybe (List UserProfile)
    }

init : ( Pool, Cmd Msg )
init =
    ( initModel, initCmd )


initCmd : Cmd Msg
initCmd =
    Cmd.none


initModel : Pool
initModel =
    { id = Id "123"
    , attending = Nothing
    }

