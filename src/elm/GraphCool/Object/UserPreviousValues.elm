-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.UserPreviousValues exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.UserPreviousValues
selection constructor =
    Object.selection constructor


auth0UserId : Field (Maybe String) GraphCool.Object.UserPreviousValues
auth0UserId =
    Object.fieldDecoder "auth0UserId" [] (Decode.string |> Decode.nullable)


bio : Field (Maybe String) GraphCool.Object.UserPreviousValues
bio =
    Object.fieldDecoder "bio" [] (Decode.string |> Decode.nullable)


birthday : Field GraphCool.Scalar.DateTime GraphCool.Object.UserPreviousValues
birthday =
    Object.fieldDecoder "birthday" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.DateTime)


createdAt : Field GraphCool.Scalar.DateTime GraphCool.Object.UserPreviousValues
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.DateTime)


email : Field (Maybe String) GraphCool.Object.UserPreviousValues
email =
    Object.fieldDecoder "email" [] (Decode.string |> Decode.nullable)


id : Field GraphCool.Scalar.Id GraphCool.Object.UserPreviousValues
id =
    Object.fieldDecoder "id" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.Id)


name : Field String GraphCool.Object.UserPreviousValues
name =
    Object.fieldDecoder "name" [] Decode.string


nameFull : Field (Maybe String) GraphCool.Object.UserPreviousValues
nameFull =
    Object.fieldDecoder "nameFull" [] (Decode.string |> Decode.nullable)


password : Field (Maybe String) GraphCool.Object.UserPreviousValues
password =
    Object.fieldDecoder "password" [] (Decode.string |> Decode.nullable)


updatedAt : Field GraphCool.Scalar.DateTime GraphCool.Object.UserPreviousValues
updatedAt =
    Object.fieldDecoder "updatedAt" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map GraphCool.Scalar.DateTime)