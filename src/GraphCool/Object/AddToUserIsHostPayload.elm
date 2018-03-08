-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.AddToUserIsHostPayload exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.AddToUserIsHostPayload
selection constructor =
    Object.selection constructor


hostsHost : SelectionSet decodesTo GraphCool.Object.Host -> Field (Maybe decodesTo) GraphCool.Object.AddToUserIsHostPayload
hostsHost object =
    Object.selectionField "hostsHost" [] object (identity >> Decode.maybe)


usersUser : SelectionSet decodesTo GraphCool.Object.User -> Field (Maybe decodesTo) GraphCool.Object.AddToUserIsHostPayload
usersUser object =
    Object.selectionField "usersUser" [] object (identity >> Decode.maybe)