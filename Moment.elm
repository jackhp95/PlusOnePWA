module Moment exposing (..)

import Date exposing (..)
import Date.Extra.Format exposing (..)
import Date.Extra.Duration exposing (..)
import Date.Extra.Config.Config_en_us exposing (..)
import Date.Extra.I18n.I_en_us exposing (..)


maybeEventDate : String -> Maybe Date
maybeEventDate date =
    (Result.toMaybe (Date.fromString date))


fullDate : Date -> String
fullDate x =
    (Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%A, %B %@e, %Y" x)


shortDate : Date -> String
shortDate x =
    (Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%a, %b %@e" x)


clockTime : Date -> String
clockTime x =
    (Date.Extra.Format.format Date.Extra.Config.Config_en_us.config "%-I:%M %P" x)
