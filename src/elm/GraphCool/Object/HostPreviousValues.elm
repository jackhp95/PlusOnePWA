-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.HostPreviousValues exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.HostPreviousValues
selection constructor =
    Object.selection constructor


createdAt : Field GraphCool.Scalar.DateTime GraphCool.Object.HostPreviousValues
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.DateTime)


description : Field (Maybe String) GraphCool.Object.HostPreviousValues
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.nullable)


id : Field GraphCool.Scalar.Id GraphCool.Object.HostPreviousValues
id =
    Object.fieldDecoder "id" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.Id)


name : Field String GraphCool.Object.HostPreviousValues
name =
    Object.fieldDecoder "name" [] Decode.string


nameFull : Field (Maybe String) GraphCool.Object.HostPreviousValues
nameFull =
    Object.fieldDecoder "nameFull" [] (Decode.string |> Decode.nullable)
