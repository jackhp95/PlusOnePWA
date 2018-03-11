module Pages.Event.Messages exposing (..)

import Pages.Pool.Model exposing (AttendModel)

type Msg
    = AddToPool
    | GotAttendResponse AttendModel
