module Pages.CreateEvent.Messages exposing (..)


type Msg
    = SubmitEvent String
    | ChangeTitle String
    | ChangeDescription String
    | ChangeLocation String
    | ChangeDate String
    | ChangeTime String
    | ChangePrivacy String
    | ChangeTaxonomy String
