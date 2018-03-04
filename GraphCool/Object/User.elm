-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.User exposing (..)

import GraphCool.Enum.ChatOrderBy
import GraphCool.Enum.EventOrderBy
import GraphCool.Enum.HostOrderBy
import GraphCool.Enum.MessageOrderBy
import GraphCool.Enum.PoolOrderBy
import GraphCool.InputObject
import GraphCool.Interface
import GraphCool.Object
import GraphCool.Scalar
import GraphCool.Union
import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.User
selection constructor =
    Object.selection constructor


{-|

  - filter -

-}
attendingEvent : ({ filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Pool -> Field (Maybe (List decodesTo)) GraphCool.Object.User
attendingEvent fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodePoolFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.PoolOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "attendingEvent" optionalArgs object (identity >> Decode.list >> Decode.maybe)


auth0UserId : Field (Maybe String) GraphCool.Object.User
auth0UserId =
    Object.fieldDecoder "auth0UserId" [] (Decode.string |> Decode.maybe)


bio : Field (Maybe String) GraphCool.Object.User
bio =
    Object.fieldDecoder "bio" [] (Decode.string |> Decode.maybe)


birthday : Field GraphCool.Scalar.DateTime GraphCool.Object.User
birthday =
    Object.fieldDecoder "birthday" [] (Decode.string |> Decode.map GraphCool.Scalar.DateTime)


createdAt : Field GraphCool.Scalar.DateTime GraphCool.Object.User
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map GraphCool.Scalar.DateTime)


{-|

  - filter -

-}
createdEvents : ({ filter : OptionalArgument GraphCool.InputObject.EventFilter, orderBy : OptionalArgument GraphCool.Enum.EventOrderBy.EventOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.EventFilter, orderBy : OptionalArgument GraphCool.Enum.EventOrderBy.EventOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Event -> Field (Maybe (List decodesTo)) GraphCool.Object.User
createdEvents fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeEventFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.EventOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "createdEvents" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
datesCanceled : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Chat -> Field (Maybe (List decodesTo)) GraphCool.Object.User
datesCanceled fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "datesCanceled" optionalArgs object (identity >> Decode.list >> Decode.maybe)


email : Field (Maybe String) GraphCool.Object.User
email =
    Object.fieldDecoder "email" [] (Decode.string |> Decode.maybe)


{-|

  - filter -

-}
hosts : ({ filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Host -> Field (Maybe (List decodesTo)) GraphCool.Object.User
hosts fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeHostFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.HostOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "hosts" optionalArgs object (identity >> Decode.list >> Decode.maybe)


id : Field GraphCool.Scalar.Id GraphCool.Object.User
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map GraphCool.Scalar.Id)


{-|

  - filter -

-}
initiated : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Chat -> Field (Maybe (List decodesTo)) GraphCool.Object.User
initiated fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "initiated" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
likedEvent : ({ filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Pool -> Field (Maybe (List decodesTo)) GraphCool.Object.User
likedEvent fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodePoolFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.PoolOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "likedEvent" optionalArgs object (identity >> Decode.list >> Decode.maybe)


name : Field String GraphCool.Object.User
name =
    Object.fieldDecoder "name" [] Decode.string


nameFull : Field (Maybe String) GraphCool.Object.User
nameFull =
    Object.fieldDecoder "nameFull" [] (Decode.string |> Decode.maybe)


{-|

  - filter -

-}
passed : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Chat -> Field (Maybe (List decodesTo)) GraphCool.Object.User
passed fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "passed" optionalArgs object (identity >> Decode.list >> Decode.maybe)


password : Field (Maybe String) GraphCool.Object.User
password =
    Object.fieldDecoder "password" [] (Decode.string |> Decode.maybe)


{-|

  - filter -

-}
proposed : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Chat -> Field (Maybe (List decodesTo)) GraphCool.Object.User
proposed fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "proposed" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
recipient : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Chat -> Field (Maybe (List decodesTo)) GraphCool.Object.User
recipient fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "recipient" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
sent : ({ filter : OptionalArgument GraphCool.InputObject.MessageFilter, orderBy : OptionalArgument GraphCool.Enum.MessageOrderBy.MessageOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.MessageFilter, orderBy : OptionalArgument GraphCool.Enum.MessageOrderBy.MessageOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Message -> Field (Maybe (List decodesTo)) GraphCool.Object.User
sent fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeMessageFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.MessageOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "sent" optionalArgs object (identity >> Decode.list >> Decode.maybe)


updatedAt : Field GraphCool.Scalar.DateTime GraphCool.Object.User
updatedAt =
    Object.fieldDecoder "updatedAt" [] (Decode.string |> Decode.map GraphCool.Scalar.DateTime)


{-|

  - filter -

-}
viewedEvent : ({ filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Pool -> Field (Maybe (List decodesTo)) GraphCool.Object.User
viewedEvent fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodePoolFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.PoolOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "viewedEvent" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-| Meta information about the query.

  - filter -

-}
attendingEventMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
attendingEventMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodePoolFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.PoolOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_attendingEventMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
createdEventsMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.EventFilter, orderBy : OptionalArgument GraphCool.Enum.EventOrderBy.EventOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.EventFilter, orderBy : OptionalArgument GraphCool.Enum.EventOrderBy.EventOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
createdEventsMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeEventFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.EventOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_createdEventsMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
datesCanceledMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
datesCanceledMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_datesCanceledMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
hostsMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
hostsMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeHostFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.HostOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_hostsMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
initiatedMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
initiatedMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_initiatedMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
likedEventMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
likedEventMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodePoolFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.PoolOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_likedEventMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
passedMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
passedMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_passedMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
proposedMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
proposedMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_proposedMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
recipientMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
recipientMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_recipientMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
sentMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.MessageFilter, orderBy : OptionalArgument GraphCool.Enum.MessageOrderBy.MessageOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.MessageFilter, orderBy : OptionalArgument GraphCool.Enum.MessageOrderBy.MessageOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
sentMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeMessageFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.MessageOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_sentMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
viewedEventMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.PoolFilter, orderBy : OptionalArgument GraphCool.Enum.PoolOrderBy.PoolOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.User
viewedEventMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodePoolFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.PoolOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_viewedEventMeta" optionalArgs object identity
