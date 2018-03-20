module Moment exposing (..)

import Date exposing (..)
import Date.Extra.Compare exposing (..)
import Date.Extra.Config.Config_en_us exposing (..)
import Date.Extra.Create exposing (..)
import Date.Extra.Format exposing (..)
import GraphCool.Scalar exposing (DateTime)


maybeEventDate : String -> Maybe Date
maybeEventDate date =
    Result.toMaybe (Date.fromString date)



-- fullDate : Date -> String
-- fullDate x =
--     Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%A, %B %@e, %Y" x


shortDate : Date -> String
shortDate x =
    Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%a, %b %@e" x


clockTime : Date -> String
clockTime x =
    Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%-I:%M %P" x


stringDateTime : DateTime -> String
stringDateTime datetime =
    String.dropRight 1 (String.dropLeft 10 (Basics.toString datetime))


compareDateTime : Date -> Date -> Order
compareDateTime date1 date2 =
    if is After date1 date2 then
        GT
    else if is Before date1 date2 then
        LT
    else
        EQ


getTime : DateTime -> String
getTime datetime =
    case maybeEventDate (stringDateTime datetime) of
        Nothing ->
            "Unknown time"

        Just dt ->
            clockTime dt


getDateTime : DateTime -> String
getDateTime datetime =
    case maybeEventDate (stringDateTime datetime) of
        Nothing ->
            "Unknown datetime"

        Just dt ->
            clockTime dt ++ " • " ++ shortDate dt
