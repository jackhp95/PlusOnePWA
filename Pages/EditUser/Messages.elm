module Pages.EditUser.Messages exposing (..)
import RemoteData exposing (..)
import Graphqelm.Http exposing (..)
import Pages.User.Model exposing (..)

type Msg
    = ChangeName String
    | ChangeFullName String
    | ChangeBio String
    | ChangeBirthday String
    | MutateUser (RemoteData Graphqelm.Http.Error (Maybe User))
    | SaveEdit
    | CreateUser