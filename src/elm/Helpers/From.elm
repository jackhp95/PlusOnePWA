module Helpers.From exposing (..)

import Date exposing (..)
import Date.Extra.Config.Config_en_us exposing (..)
import Date.Extra.Format exposing (..)
import EveryDict exposing (..)
import GraphCool.Scalar exposing (..)
import Types exposing (..)


-- Id --


idToString : Id -> String
idToString id =
    case id of
        Id string ->
            string



-- DateTime --


dateTimeToDateWithDefault : DateTime -> Date
dateTimeToDateWithDefault dateTime =
    Result.withDefault epoch <| Date.fromString <| dateTimeToString dateTime


dateTimeToString : DateTime -> String
dateTimeToString dateTime =
    case dateTime of
        DateTime string ->
            string


dateTimeToViewClockTime : DateTime -> String
dateTimeToViewClockTime datetime =
    case Date.fromString (dateTimeToString datetime) of
        Err _ ->
            "Unknown time"

        Ok dt ->
            dateToViewClockTime dt


dateTimeToViewShortDate : DateTime -> String
dateTimeToViewShortDate datetime =
    case Date.fromString (dateTimeToString datetime) of
        Err _ ->
            "Unknown datetime"

        Ok dt ->
            dateToViewClockTime dt ++ " • " ++ dateToViewShortDate dt



-- Host --


listHostToDict : List Host -> EveryDict Id Host
listHostToDict hosts =
    hosts
        |> List.map (\host -> ( host.id, host ))
        |> EveryDict.fromList



-- Venue --


listVenueToDict : List Venue -> EveryDict Id Venue
listVenueToDict venues =
    venues
        |> List.map (\venue -> ( venue.id, venue ))
        |> EveryDict.fromList



-- Location --


listLocationToDict : List Location -> EveryDict Id Location
listLocationToDict locations =
    locations
        |> List.map (\location -> ( location.id, location ))
        |> EveryDict.fromList



-- Event --


listEventToDict : List Event -> EveryDict Id API
listEventToDict events =
    events
        |> List.map (\event -> ( event.id, GraphCool event ))
        |> EveryDict.fromList



-- Pool --


listPoolToDict : List Pool -> EveryDict Id Pool
listPoolToDict pools =
    pools
        |> List.map (\pool -> ( pool.id, pool ))
        |> EveryDict.fromList



-- Message --


listMessageToDict : List Message -> EveryDict Id Message
listMessageToDict messages =
    messages
        |> List.map (\message -> ( message.id, message ))
        |> EveryDict.fromList



-- Chat --


listChatToDict : List Chat -> EveryDict Id Chat
listChatToDict chats =
    chats
        |> List.map (\chat -> ( chat.id, chat ))
        |> EveryDict.fromList



-- User --


listUserToDict : List User -> EveryDict Id User
listUserToDict users =
    users
        |> List.map (\user -> ( user.id, user ))
        |> EveryDict.fromList



-- API --


apiToDate : API -> Date
apiToDate api =
    case api of
        SeatGeek event ->
            event.datetime_local
                |> stringToDateWithDefault

        GraphCool event ->
            dateTimeToString event.startsAt
                |> stringToDateWithDefault



-- ---------- --
-- Primitives --
-- ---------- --
-- String --


stringToDateWithDefault : String -> Date
stringToDateWithDefault string =
    Date.fromString string
        |> Result.withDefault epoch



-- Date --


dateToDateTime : Date -> DateTime
dateToDateTime date =
    DateTime <| Date.Extra.Format.isoDateString date


dateToViewShortDate : Date -> String
dateToViewShortDate date =
    Date.Extra.Format.format
        Date.Extra.Config.Config_en_us.config
        "%a, %b %@e"
        date


dateToViewLongDate : Date -> String
dateToViewLongDate date =
    Date.Extra.Format.format
        Date.Extra.Config.Config_en_us.config
        "%A, %B %@e, %Y"
        date


dateToViewClockTime : Date -> String
dateToViewClockTime date =
    Date.Extra.Format.format
        Date.Extra.Config.Config_en_us.config
        "%-I:%M %P"
        date
