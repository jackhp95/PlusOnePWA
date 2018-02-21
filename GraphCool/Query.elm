-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Query exposing (..)

import GraphCool.Enum.ChatOrderBy
import GraphCool.Enum.EventOrderBy
import GraphCool.Enum.FileOrderBy
import GraphCool.Enum.HostOrderBy
import GraphCool.Enum.LocationOrderBy
import GraphCool.Enum.MessageOrderBy
import GraphCool.Enum.UserOrderBy
import GraphCool.Enum.VenueOrderBy
import GraphCool.InputObject
import GraphCool.Interface
import GraphCool.Object
import GraphCool.Scalar
import GraphCool.Union
import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)


{-| Select fields to build up a top-level query. The request can be sent with
functions from `Graphqelm.Http`.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) RootQuery
selection constructor =
    Object.selection constructor


{-|

  - filter -

-}
allChats : SelectionSet decodesTo GraphCool.Object.Chat -> Field (List decodesTo) RootQuery
allChats object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "allChats" optionalArgs object (identity >> Decode.list)


{-|

  - filter -

-}
allEvents : SelectionSet decodesTo GraphCool.Object.Event -> Field (List decodesTo) RootQuery
allEvents object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeEventFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.EventOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "allEvents" optionalArgs object (identity >> Decode.list)


{-|

  - filter -

-}
allFiles : SelectionSet decodesTo GraphCool.Object.File -> Field (List decodesTo) RootQuery
allFiles object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeFileFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.FileOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "allFiles" optionalArgs object (identity >> Decode.list)


{-|

  - filter -

-}
allHosts : SelectionSet decodesTo GraphCool.Object.Host -> Field (List decodesTo) RootQuery
allHosts object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeHostFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.HostOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "allHosts" optionalArgs object (identity >> Decode.list)


{-|

  - filter -

-}
allLocations : SelectionSet decodesTo GraphCool.Object.Location -> Field (List decodesTo) RootQuery
allLocations object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeLocationFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.LocationOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "allLocations" optionalArgs object (identity >> Decode.list)


{-|

  - filter -

-}
allMessages : SelectionSet decodesTo GraphCool.Object.Message -> Field (List decodesTo) RootQuery
allMessages object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeMessageFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.MessageOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "allMessages" optionalArgs object (identity >> Decode.list)


{-|

  - filter -

-}
allUsers : SelectionSet decodesTo GraphCool.Object.User -> Field (List decodesTo) RootQuery
allUsers object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "allUsers" optionalArgs object (identity >> Decode.list)


{-|

  - filter -

-}
allVenues : SelectionSet decodesTo GraphCool.Object.Venue -> Field (List decodesTo) RootQuery
allVenues object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeVenueFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.VenueOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "allVenues" optionalArgs object (identity >> Decode.list)


{-|

  - filter -

-}
allChatsMeta_ : SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo RootQuery
allChatsMeta_ object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_allChatsMeta" optionalArgs object identity


{-|

  - filter -

-}
allEventsMeta_ : SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo RootQuery
allEventsMeta_ object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeEventFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.EventOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_allEventsMeta" optionalArgs object identity


{-|

  - filter -

-}
allFilesMeta_ : SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo RootQuery
allFilesMeta_ object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeFileFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.FileOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_allFilesMeta" optionalArgs object identity


{-|

  - filter -

-}
allHostsMeta_ : SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo RootQuery
allHostsMeta_ object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeHostFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.HostOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_allHostsMeta" optionalArgs object identity


{-|

  - filter -

-}
allLocationsMeta_ : SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo RootQuery
allLocationsMeta_ object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeLocationFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.LocationOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_allLocationsMeta" optionalArgs object identity


{-|

  - filter -

-}
allMessagesMeta_ : SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo RootQuery
allMessagesMeta_ object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeMessageFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.MessageOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_allMessagesMeta" optionalArgs object identity


{-|

  - filter -

-}
allUsersMeta_ : SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo RootQuery
allUsersMeta_ object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_allUsersMeta" optionalArgs object identity


{-|

  - filter -

-}
allVenuesMeta_ : SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo RootQuery
allVenuesMeta_ object =
    let
        filledInOptionals =
         { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeVenueFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.VenueOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_allVenuesMeta" optionalArgs object identity


{-|

  - id -

-}
chat : SelectionSet decodesTo GraphCool.Object.Chat -> Field (Maybe decodesTo) RootQuery
chat object =
    let
        filledInOptionals =
         { id = Absent }

        optionalArgs =
            [ Argument.optional "id" filledInOptionals.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "Chat" optionalArgs object (identity >> Decode.maybe)


{-|

  - id -

-}
event : SelectionSet decodesTo GraphCool.Object.Event -> Field (Maybe decodesTo) RootQuery
event object =
    let
        filledInOptionals =
         { id = Absent }

        optionalArgs =
            [ Argument.optional "id" filledInOptionals.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "Event" optionalArgs object (identity >> Decode.maybe)


{-|

  - id -
  - secret -
  - url -

-}
file : SelectionSet decodesTo GraphCool.Object.File -> Field (Maybe decodesTo) RootQuery
file object =
    let
        filledInOptionals =
         { id = Absent, secret = Absent, url = Absent }

        optionalArgs =
            [ Argument.optional "id" filledInOptionals.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw), Argument.optional "secret" filledInOptionals.secret Encode.string, Argument.optional "url" filledInOptionals.url Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionField "File" optionalArgs object (identity >> Decode.maybe)


{-|

  - id -

-}
host : SelectionSet decodesTo GraphCool.Object.Host -> Field (Maybe decodesTo) RootQuery
host object =
    let
        filledInOptionals =
         { id = Absent }

        optionalArgs =
            [ Argument.optional "id" filledInOptionals.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "Host" optionalArgs object (identity >> Decode.maybe)


{-|

  - id -

-}
location : SelectionSet decodesTo GraphCool.Object.Location -> Field (Maybe decodesTo) RootQuery
location object =
    let
        filledInOptionals =
         { id = Absent }

        optionalArgs =
            [ Argument.optional "id" filledInOptionals.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "Location" optionalArgs object (identity >> Decode.maybe)


{-|

  - id -

-}
message : SelectionSet decodesTo GraphCool.Object.Message -> Field (Maybe decodesTo) RootQuery
message object =
    let
        filledInOptionals =
         { id = Absent }

        optionalArgs =
            [ Argument.optional "id" filledInOptionals.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "Message" optionalArgs object (identity >> Decode.maybe)


{-|

  - auth0UserId -
  - email -
  - id -

-}
user : SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe decodesTo) RootQuery
user object =
    let
        filledInOptionals =
         { auth0UserId = Absent, email = Absent, id = Absent }

        optionalArgs =
            [ Argument.optional "auth0UserId" filledInOptionals.auth0UserId Encode.string, Argument.optional "email" filledInOptionals.email Encode.string, Argument.optional "id" filledInOptionals.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "User" optionalArgs object (identity >> Decode.maybe)


{-|

  - id -

-}
venue : SelectionSet decodesTo GraphCool.Object.Venue -> Field (Maybe decodesTo) RootQuery
venue object =
    let
        filledInOptionals =
         { id = Absent }

        optionalArgs =
            [ Argument.optional "id" filledInOptionals.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "Venue" optionalArgs object (identity >> Decode.maybe)


me : SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe decodesTo) RootQuery
me object =
    Object.selectionField "me" [] object (identity >> Decode.maybe)


{-| Fetches an object given its ID

  - id - The ID of an object

-}
node : { id : GraphCool.Scalar.Id } -> SelectionSet decodesTo GraphCool.Interface.Node -> Field (Maybe decodesTo) RootQuery
node requiredArgs object =
    Object.selectionField "node" [ Argument.required "id" requiredArgs.id (\(GraphCool.Scalar.Id raw) -> Encode.string raw) ] object (identity >> Decode.maybe)
