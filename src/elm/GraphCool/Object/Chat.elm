-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.Chat exposing (..)

import GraphCool.Enum.DateState
import GraphCool.Enum.MessageOrderBy
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.Chat
selection constructor =
    Object.selection constructor


type alias CanceledOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.UserFilter }


{-|

  - filter -

-}
canceled : (CanceledOptionalArguments -> CanceledOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe decodesTo) GraphCool.Object.Chat
canceled fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "canceled" optionalArgs object (identity >> Decode.nullable)


dateState : Field GraphCool.Enum.DateState.DateState GraphCool.Object.Chat
dateState =
    Object.fieldDecoder "dateState" [] GraphCool.Enum.DateState.decoder


id : Field GraphCool.Scalar.Id GraphCool.Object.Chat
id =
    Object.fieldDecoder "id" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.Id)


type alias InitiatedOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.UserFilter }


{-|

  - filter -

-}
initiated : (InitiatedOptionalArguments -> InitiatedOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.User -> Field decodesTo GraphCool.Object.Chat
initiated fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "initiated" optionalArgs object identity


type alias MessagesOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.MessageFilter, orderBy : OptionalArgument GraphCool.Enum.MessageOrderBy.MessageOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }


{-|

  - filter -

-}
messages : (MessagesOptionalArguments -> MessagesOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.Message -> Field (Maybe (List decodesTo)) GraphCool.Object.Chat
messages fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeMessageFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.MessageOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "messages" optionalArgs object (identity >> Decode.list >> Decode.nullable)


type alias PassedOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.UserFilter }


{-|

  - filter -

-}
passed : (PassedOptionalArguments -> PassedOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe decodesTo) GraphCool.Object.Chat
passed fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "passed" optionalArgs object (identity >> Decode.nullable)


type alias PoolOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.PoolFilter }


{-|

  - filter -

-}
pool : (PoolOptionalArguments -> PoolOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.Pool -> Field decodesTo GraphCool.Object.Chat
pool fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodePoolFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "pool" optionalArgs object identity


type alias ProposedOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.UserFilter }


{-|

  - filter -

-}
proposed : (ProposedOptionalArguments -> ProposedOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe decodesTo) GraphCool.Object.Chat
proposed fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "proposed" optionalArgs object (identity >> Decode.nullable)


type alias RecipientOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.UserFilter }


{-|

  - filter -

-}
recipient : (RecipientOptionalArguments -> RecipientOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe decodesTo) GraphCool.Object.Chat
recipient fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "recipient" optionalArgs object (identity >> Decode.nullable)


type alias MessagesMetaOptionalArguments =
    { filter : OptionalArgument GraphCool.InputObject.MessageFilter, orderBy : OptionalArgument GraphCool.Enum.MessageOrderBy.MessageOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }


{-| Meta information about the query.

  - filter -

-}
messagesMeta_ : (MessagesMetaOptionalArguments -> MessagesMetaOptionalArguments) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Chat
messagesMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeMessageFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.MessageOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_messagesMeta" optionalArgs object identity
