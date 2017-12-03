module Moment exposing (..)

import Date exposing (..)
import Date.Extra.Format exposing (..)
import Date.Extra.Duration exposing (..)
import Date.Extra.Config.Config_en_us exposing (..)
import Date.Extra.I18n.I_en_us exposing (..)


deltaTime : Maybe Date -> Maybe Date -> Maybe DeltaRecord
deltaTime now upcoming =
    Maybe.map2 Date.Extra.Duration.diff upcoming now


maybeEventDate : String -> Maybe Date
maybeEventDate date =
    (Result.toMaybe (Date.fromString date))


simpleTime : DeltaRecord -> Maybe Date -> String
simpleTime delta maybeEventDate =
    case maybeEventDate of
        Nothing ->
            "welp, I couldn't determine the date of the event"

        Just x ->
            if (String.contains "-" (toString delta)) then
                "happening now"
            else if (delta.year > 1) then
                "in over a year"
            else if (delta.year == 1) then
                "in a year"
            else if (delta.month > 1) then
                "in " ++ (monthName (month x))
            else if (delta.month == 1) then
                "next month"
            else if (delta.day > 13) then
                "in " ++ (toString (delta.day // 7)) ++ " weeks"
            else if (delta.day > 6) then
                "next " ++ (dayName (dayOfWeek x))
            else if (delta.day > 1) then
                somePartOfDay (hour x) (dayName (dayOfWeek x))
            else if (delta.day == 1) then
                somePartOfDay (hour x) (dayName (dayOfWeek x))
            else
                thisPartOfDay (hour x)


somePartOfDay : Int -> String -> String
somePartOfDay hour day =
    if (hour == 0) then
        day ++ " at midnight"
    else if (hour < 3) then
        day ++ " after midnight"
    else if (hour < 5) then
        day ++ " at dawn"
    else if (hour < 8) then
        "early " ++ day ++ " morning"
    else if (hour < 10) then
        day ++ " morning"
    else if (hour < 12) then
        "late " ++ day ++ " morning"
    else if (hour == 12) then
        day ++ " at noon"
    else if (hour < 15) then
        day ++ " afternoon"
    else if (hour < 17) then
        "late " ++ day ++ " afternoon"
    else if (hour < 20) then
        day ++ " evening"
    else if (hour < 23) then
        day ++ " night"
    else if (hour < 24) then
        "late " ++ day ++ " night"
    else
        "For some reason, I think there are more than 24 hours in a day."


thisPartOfDay : Int -> String
thisPartOfDay hour =
    if hour == 1 then
        "in an hour"
    else
        "in " ++ (toString hour) ++ " hours"


fullDate : Date -> String
fullDate x =
    (Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%A, %B %@e, %Y" x)


clockTime : Date -> String
clockTime x =
    (Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%-I:%M %P" x)
