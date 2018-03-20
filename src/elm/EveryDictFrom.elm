module EveryDictFrom exposing (..)

import EveryDict exposing (..)
import GraphCool.Scalar exposing (..)
import Types exposing (..)


listHost : List Host -> EveryDict Id Host
listHost hosts =
    hosts
        |> List.map (\host -> ( host.id, host ))
        |> EveryDict.fromList


listVenue : List Venue -> EveryDict Id Venue
listVenue venues =
    venues
        |> List.map (\venue -> ( venue.id, venue ))
        |> EveryDict.fromList


listLocation : List Location -> EveryDict Id Location
listLocation locations =
    locations
        |> List.map (\location -> ( location.id, location ))
        |> EveryDict.fromList


listEvent : List Event -> EveryDict Id API
listEvent events =
    events
        |> List.map (\event -> ( event.id, GraphCool event ))
        |> EveryDict.fromList


listPool : List Pool -> EveryDict Id Pool
listPool pools =
    pools
        |> List.map (\pool -> ( pool.id, pool ))
        |> EveryDict.fromList


listMessage : List Message -> EveryDict Id Message
listMessage messages =
    messages
        |> List.map (\message -> ( message.id, message ))
        |> EveryDict.fromList


listChat : List Chat -> EveryDict Id Chat
listChat chats =
    chats
        |> List.map (\chat -> ( chat.id, chat ))
        |> EveryDict.fromList


listUser : List User -> EveryDict Id User
listUser users =
    users
        |> List.map (\user -> ( user.id, user ))
        |> EveryDict.fromList
