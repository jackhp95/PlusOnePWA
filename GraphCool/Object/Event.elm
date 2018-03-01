-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.Event exposing (..)

import GraphCool.Enum.ChatOrderBy
import GraphCool.Enum.HostOrderBy
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
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.Event
selection constructor =
    Object.selection constructor


{-|

  - filter -

-}
chats : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Chat -> Field (Maybe (List decodesTo)) GraphCool.Object.Event
chats fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeChatFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.ChatOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "chats" optionalArgs object (identity >> Decode.list >> Decode.maybe)


createdAt : Field GraphCool.Scalar.DateTime GraphCool.Object.Event
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map GraphCool.Scalar.DateTime)


{-|

  - filter -

-}
createdBy : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter }) -> SelectionSet decodesTo GraphCool.Object.User -> Field decodesTo GraphCool.Object.Event
createdBy fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "createdBy" optionalArgs object identity


endsAt : Field (Maybe GraphCool.Scalar.DateTime) GraphCool.Object.Event
endsAt =
    Object.fieldDecoder "endsAt" [] (Decode.string |> Decode.map GraphCool.Scalar.DateTime |> Decode.maybe)


{-|

  - filter -

-}
hosts : ({ filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Host -> Field (Maybe (List decodesTo)) GraphCool.Object.Event
hosts fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeHostFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.HostOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "hosts" optionalArgs object (identity >> Decode.list >> Decode.maybe)


id : Field GraphCool.Scalar.Id GraphCool.Object.Event
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map GraphCool.Scalar.Id)


name : Field String GraphCool.Object.Event
name =
    Object.fieldDecoder "name" [] Decode.string


nameFull : Field (Maybe String) GraphCool.Object.Event
nameFull =
    Object.fieldDecoder "nameFull" [] (Decode.string |> Decode.maybe)


private : Field Bool GraphCool.Object.Event
private =
    Object.fieldDecoder "private" [] Decode.bool


startsAt : Field GraphCool.Scalar.DateTime GraphCool.Object.Event
startsAt =
    Object.fieldDecoder "startsAt" [] (Decode.string |> Decode.map GraphCool.Scalar.DateTime)


{-|

  - filter -

-}
usersAttending : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe (List decodesTo)) GraphCool.Object.Event
usersAttending fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "usersAttending" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
usersLiked : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe (List decodesTo)) GraphCool.Object.Event
usersLiked fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "usersLiked" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
usersViewed : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe (List decodesTo)) GraphCool.Object.Event
usersViewed fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "usersViewed" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-|

  - filter -

-}
venues : ({ filter : OptionalArgument GraphCool.InputObject.VenueFilter, orderBy : OptionalArgument GraphCool.Enum.VenueOrderBy.VenueOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.VenueFilter, orderBy : OptionalArgument GraphCool.Enum.VenueOrderBy.VenueOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.Venue -> Field (Maybe (List decodesTo)) GraphCool.Object.Event
venues fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeVenueFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.VenueOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "venues" optionalArgs object (identity >> Decode.list >> Decode.maybe)


{-| Meta information about the query.

  - filter -

-}
chatsMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.ChatFilter, orderBy : OptionalArgument GraphCool.Enum.ChatOrderBy.ChatOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Event
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
hostsMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.HostFilter, orderBy : OptionalArgument GraphCool.Enum.HostOrderBy.HostOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Event
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
usersAttendingMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Event
usersAttendingMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_usersAttendingMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
usersLikedMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Event
usersLikedMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_usersLikedMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
usersViewedMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.UserFilter, orderBy : OptionalArgument GraphCool.Enum.UserOrderBy.UserOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Event
usersViewedMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeUserFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.UserOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_usersViewedMeta" optionalArgs object identity


{-| Meta information about the query.

  - filter -

-}
venuesMeta_ : ({ filter : OptionalArgument GraphCool.InputObject.VenueFilter, orderBy : OptionalArgument GraphCool.Enum.VenueOrderBy.VenueOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int } -> { filter : OptionalArgument GraphCool.InputObject.VenueFilter, orderBy : OptionalArgument GraphCool.Enum.VenueOrderBy.VenueOrderBy, skip : OptionalArgument Int, after : OptionalArgument String, before : OptionalArgument String, first : OptionalArgument Int, last : OptionalArgument Int }) -> SelectionSet decodesTo GraphCool.Object.QueryMeta_ -> Field decodesTo GraphCool.Object.Event
venuesMeta_ fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeVenueFilter, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum GraphCool.Enum.VenueOrderBy.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionField "_venuesMeta" optionalArgs object identity