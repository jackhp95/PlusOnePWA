-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Object.FilePreviousValues exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) PlusOne.Object.FilePreviousValues
selection constructor =
    Object.selection constructor


contentType : Field String PlusOne.Object.FilePreviousValues
contentType =
    Object.fieldDecoder "contentType" [] Decode.string


createdAt : Field PlusOne.Scalar.DateTime PlusOne.Object.FilePreviousValues
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map PlusOne.Scalar.DateTime)


id : Field PlusOne.Scalar.Id PlusOne.Object.FilePreviousValues
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map PlusOne.Scalar.Id)


name : Field String PlusOne.Object.FilePreviousValues
name =
    Object.fieldDecoder "name" [] Decode.string


secret : Field String PlusOne.Object.FilePreviousValues
secret =
    Object.fieldDecoder "secret" [] Decode.string


size : Field Int PlusOne.Object.FilePreviousValues
size =
    Object.fieldDecoder "size" [] Decode.int


updatedAt : Field PlusOne.Scalar.DateTime PlusOne.Object.FilePreviousValues
updatedAt =
    Object.fieldDecoder "updatedAt" [] (Decode.string |> Decode.map PlusOne.Scalar.DateTime)


url : Field String PlusOne.Object.FilePreviousValues
url =
    Object.fieldDecoder "url" [] Decode.string