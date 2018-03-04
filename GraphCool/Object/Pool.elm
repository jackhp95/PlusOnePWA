-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.Pool exposing (..)

import GraphCool.Enum.ChatOrderBy
import GraphCool.Enum.UserOrderBy
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.Pool
selection constructor =
    Object.selection constructor


{-|

  - filter -

-}
attending : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe (List decodesTo)) GraphCool.Object.Pool
attending fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "attending" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
chats : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Chat -> Field (Maybe (List decodesTo)) GraphCool.Object.Pool
chats fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "chats" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
event : ({ filter : OptionalArgument GraphCool.InputObject.EventFilter } -> { filter : OptionalArgument GraphCool.InputObject.EventFilter }) -> SelectionSet decodesTo GraphCool.Object.Event -> Field (Maybe decodesTo) GraphCool.Object.Pool
event fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeEventFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "event" optionalArgs object (identity >> Decode.maybe)


id : Field GraphCool.Scalar.Id GraphCool.Object.Pool
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map GraphCool.Scalar.Id)


{-|

  - filter -

-}
liked : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe (List decodesTo)) GraphCool.Object.Pool
liked fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "liked" optionalArgs object (identity >> Decode.list >> Decode.maybe)


seatGeekId : Field (Maybe String) GraphCool.Object.Pool
seatGeekId =
    Object.fieldDecoder "seatGeekId" [] (Decode.string |> Decode.maybe)


{-|

  - filter -

-}
viewed : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe (List decodesTo)) GraphCool.Object.Pool
viewed fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "viewed" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-| Meta information about the query.

  - filter -

-}
attendingMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Pool
attendingMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_attendingMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
chatsMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Pool
chatsMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_chatsMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
likedMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Pool
likedMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_likedMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
viewedMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Pool
viewedMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_viewedMeta" optionalArgs object identity
