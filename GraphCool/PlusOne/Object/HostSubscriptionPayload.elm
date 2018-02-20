-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Object.HostSubscriptionPayload exposing (..)

import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import PlusOne.Enum.ModelMutationType_
import PlusOne.InputObject
import PlusOne.Interface
import PlusOne.Object
import PlusOne.Scalar
import PlusOne.Union


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) PlusOne.Object.HostSubscriptionPayload
selection constructor =
    Object.selection constructor


mutation : Field PlusOne.Enum.ModelMutationType_.ModelMutationType_ PlusOne.Object.HostSubscriptionPayload
mutation =
    Object.fieldDecoder "mutation" [] PlusOne.Enum.ModelMutationType_.decoder


node : SelectionSet decodesTo PlusOne.Object.Host -> Field (Maybe decodesTo) PlusOne.Object.HostSubscriptionPayload
node object =
    Object.selectionField "node" [] object (identity >> Decode.maybe)


updatedFields : Field (Maybe (List String)) PlusOne.Object.HostSubscriptionPayload
updatedFields =
    Object.fieldDecoder "updatedFields" [] (Decode.string |> Decode.list |> Decode.maybe)


previousValues : SelectionSet decodesTo PlusOne.Object.HostPreviousValues -> Field (Maybe decodesTo) PlusOne.Object.HostSubscriptionPayload
previousValues object =
    Object.selectionField "previousValues" [] object (identity >> Decode.maybe)
