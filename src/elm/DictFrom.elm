module DictFrom exposing (..)

import Dict exposing (..)
import Types exposing (..)


listHost : List Host -> Dict String Host
listHost hosts =
    hosts
        |> List.map (\host -> ( toString host.id, host ))
        |> Dict.fromList


listVenue : List Venue -> Dict String Venue
listVenue venues =
    venues
        |> List.map (\venue -> ( toString venue.id, venue ))
        |> Dict.fromList


listLocation : List Location -> Dict String Location
listLocation locations =
    locations
        |> List.map (\location -> ( toString location.id, location ))
        |> Dict.fromList


listEvent : List Event -> Dict String API
listEvent events =
    events
        |> List.map (\event -> ( toString event.id, GraphCool event ))
        |> Dict.fromList


listPool : List Pool -> Dict String Pool
listPool pools =
    pools
        |> List.map (\pool -> ( toString pool.id, pool ))
        |> Dict.fromList


listMessage : List Message -> Dict String Message
listMessage messages =
    messages
        |> List.map (\message -> ( toString message.id, message ))
        |> Dict.fromList


listChat : List Chat -> Dict String Chat
listChat chats =
    chats
        |> List.map (\chat -> ( toString chat.id, chat ))
        |> Dict.fromList


listUser : List User -> Dict String User
listUser users =
    users
        |> List.map (\user -> ( toString user.id, user ))
        |> Dict.fromList
