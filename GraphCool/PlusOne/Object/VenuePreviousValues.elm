-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Object.VenuePreviousValues exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) PlusOne.Object.VenuePreviousValues
selection constructor =
    Object.selection constructor


createdAt : Field PlusOne.Scalar.DateTime PlusOne.Object.VenuePreviousValues
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map PlusOne.Scalar.DateTime)


description : Field (Maybe String) PlusOne.Object.VenuePreviousValues
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.maybe)


id : Field PlusOne.Scalar.Id PlusOne.Object.VenuePreviousValues
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map PlusOne.Scalar.Id)


name : Field String PlusOne.Object.VenuePreviousValues
name =
    Object.fieldDecoder "name" [] Decode.string


nameFull : Field String PlusOne.Object.VenuePreviousValues
nameFull =
    Object.fieldDecoder "nameFull" [] Decode.string