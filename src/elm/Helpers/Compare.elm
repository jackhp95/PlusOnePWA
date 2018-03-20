module Helpers.Compare exposing (..)

import Date exposing (Date)
import Date.Extra.Compare exposing (..)
import Helpers.From as From exposing (..)
import Types exposing (..)


-- ---------- --
-- Primitives --
-- ---------- --
-- Date --


onDate : Date -> Date -> Order
onDate date1 date2 =
    if is After date1 date2 then
        GT
    else if is Before date1 date2 then
        LT
    else
        EQ



-- ------------- --
-- Product Types --
-- ------------- --
-- API --


apiOnDate : API -> API -> Order
apiOnDate api1 api2 =
    let
        date1 =
            From.apiToDate api1

        date2 =
            From.apiToDate api2
    in
    onDate date1 date2
