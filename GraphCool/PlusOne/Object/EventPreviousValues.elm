-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Object.EventPreviousValues exposing (..)

import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import PlusOne.InputObject
import PlusOne.Interface
import PlusOne.Object
import PlusOne.Scalar
import PlusOne.Union


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) PlusOne.Object.EventPreviousValues
selection constructor =
    Object.selection constructor


createdAt : Field PlusOne.Scalar.DateTime PlusOne.Object.EventPreviousValues
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map PlusOne.Scalar.DateTime)


endsAt : Field (Maybe PlusOne.Scalar.DateTime) PlusOne.Object.EventPreviousValues
endsAt =
    Object.fieldDecoder "endsAt" [] (Decode.string |> Decode.map PlusOne.Scalar.DateTime |> Decode.maybe)


id : Field PlusOne.Scalar.Id PlusOne.Object.EventPreviousValues
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map PlusOne.Scalar.Id)


name : Field String PlusOne.Object.EventPreviousValues
name =
    Object.fieldDecoder "name" [] Decode.string


nameFull : Field (Maybe String) PlusOne.Object.EventPreviousValues
nameFull =
    Object.fieldDecoder "nameFull" [] (Decode.string |> Decode.maybe)


private : Field Bool PlusOne.Object.EventPreviousValues
private =
    Object.fieldDecoder "private" [] Decode.bool


startsAt : Field PlusOne.Scalar.DateTime PlusOne.Object.EventPreviousValues
startsAt =
    Object.fieldDecoder "startsAt" [] (Decode.string |> Decode.map PlusOne.Scalar.DateTime)
