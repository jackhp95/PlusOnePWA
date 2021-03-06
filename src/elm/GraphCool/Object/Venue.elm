-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.Venue exposing (..)

import GraphCool.Enum.EventOrderBy
import GraphCool.Enum.HostOrderBy
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.Venue
selection constructor =
    Object.selection constructor


createdAt : Field GraphCool.Scalar.DateTime GraphCool.Object.Venue
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.DateTime)


description : Field (Maybe String) GraphCool.Object.Venue
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.nullable)


type alias EventsOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.EventFilter, orderBy : OptionalArgument GraphCool.Enum.EventOrderBy.EventOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }


{-|

  - filter -

-}
events : (EventsOptionalArguments -> EventsOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.Event -> Field (Maybe (List decodesTo)) GraphCool.Object.Venue
events fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeEventFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.EventOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "events" optionalArgs object (identity >> Decode.list >> Decode.nullable)


type alias HostsOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }


{-|

  - filter -

-}
hosts : (HostsOptionalArguments -> HostsOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.Host -> Field (Maybe (List decodesTo)) GraphCool.Object.Venue
hosts fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeHostFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.HostOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "hosts" optionalArgs object (identity >> Decode.list >> Decode.nullable)


id : Field GraphCool.Scalar.Id GraphCool.Object.Venue
id =
    Object.fieldDecoder "id" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.Id)


type alias LocationOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.LocationFilter }


{-|

  - filter -

-}
location : (LocationOptionalArguments -> LocationOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.Location -> Field (Maybe decodesTo) GraphCool.Object.Venue
location fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeLocationFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "location" optionalArgs object (identity >> Decode.nullable)


name : Field String GraphCool.Object.Venue
name =
    Object.fieldDecoder "name" [] Decode.string


nameFull : Field String GraphCool.Object.Venue
nameFull =
    Object.fieldDecoder "nameFull" [] Decode.string


type alias EventsMetaOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.EventFilter, orderBy : OptionalArgument GraphCool.Enum.EventOrderBy.EventOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }


{-| Meta information about the query.

  - filter -

-}
eventsMeta_ : (EventsMetaOptionalArguments -> EventsMetaOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Venue
eventsMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeEventFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.EventOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_eventsMeta" optionalArgs object identity


type alias HostsMetaOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }


{-| Meta information about the query.

  - filter -

-}
hostsMeta_ : (HostsMetaOptionalArguments -> HostsMetaOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Venue
hostsMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeHostFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.HostOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_hostsMeta" optionalArgs object identity
