module Pages.CreateEvent.Messages exposing (..)
import Pages.Event.Model exposing(..)



type Msg
    = SubmitEvent String
    -- | ChangeTitle String
    -- | ChangeDescription String
    -- | ChangeLocation String
    -- | ChangeDate String
    -- | ChangeTime String
    -- | ChangePrivacy String
    -- | ChangeTaxonomy String
    | GotResponse ResponseModel
    | MakeRequest
    | ChangeName String
    | ChangeNameFull String
