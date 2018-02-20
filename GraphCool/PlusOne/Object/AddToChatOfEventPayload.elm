-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Object.AddToChatOfEventPayload exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) PlusOne.Object.AddToChatOfEventPayload
selection constructor =
    Object.selection constructor


chatsChat : SelectionSet decodesTo PlusOne.Object.Chat -> Field (Maybe decodesTo) PlusOne.Object.AddToChatOfEventPayload
chatsChat object =
    Object.selectionField "chatsChat" [] object (identity >> Decode.maybe)


eventEvent : SelectionSet decodesTo PlusOne.Object.Event -> Field (Maybe decodesTo) PlusOne.Object.AddToChatOfEventPayload
eventEvent object =
    Object.selectionField "eventEvent" [] object (identity >> Decode.maybe)
