module Pages.EditUser.Messages exposing (..)

import Graphqelm.Http exposing (..)
import Pages.User.Model exposing (..)
import RemoteData exposing (..)


type Msg
    = ChangeName String
    | ChangeFullName String
    | ChangeBio String
    | ChangeBirthday String
    | MutateUser (RemoteData Graphqelm.Http.Error (Maybe User))
    | SaveEdit
