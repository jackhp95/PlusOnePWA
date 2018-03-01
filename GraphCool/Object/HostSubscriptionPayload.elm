-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.HostSubscriptionPayload exposing (..)

import GraphCool.Enum.ModelMutationType_
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.HostSubscriptionPayload
selection constructor =
    Object.selection constructor


mutation : Field GraphCool.Enum.ModelMutationType_.ModelMutationType_ GraphCool.Object.HostSubscriptionPayload
mutation =
    Object.fieldDecoder "mutation" [] GraphCool.Enum.ModelMutationType_.decoder


node : SelectionSet decodesTo GraphCool.Object.Host -> Field (Maybe decodesTo) GraphCool.Object.HostSubscriptionPayload
node object =
    Object.selectionField "node" [] object (identity >> Decode.maybe)


updatedFields : Field (Maybe (List String)) GraphCool.Object.HostSubscriptionPayload
updatedFields =
    Object.fieldDecoder "updatedFields" [] (Decode.string |> Decode.list |> Decode.maybe)


previousValues : SelectionSet decodesTo GraphCool.Object.HostPreviousValues -> Field (Maybe decodesTo) GraphCool.Object.HostSubscriptionPayload
previousValues object =
    Object.selectionField "previousValues" [] object (identity >> Decode.maybe)