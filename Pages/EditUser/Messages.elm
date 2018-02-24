module Pages.EditUser.Messages exposing (..)

type Msg
    = ChangeName String
    | ChangeFullName String
    | ChangeBio String
    | ChangeBirthday String
    | ChangeGender String
    | ChangeSeekingGender String
    | SaveEdit