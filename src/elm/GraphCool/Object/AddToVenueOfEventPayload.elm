-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.AddToVenueOfEventPayload exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.AddToVenueOfEventPayload
selection constructor =
    Object.selection constructor


eventsEvent : SelectionSet decodesTo GraphCool.Object.Event -> Field (Maybe decodesTo) GraphCool.Object.AddToVenueOfEventPayload
eventsEvent object =
    Object.selectionField "eventsEvent" [] object (identity >> Decode.nullable)


venuesVenue : SelectionSet decodesTo GraphCool.Object.Venue -> Field (Maybe decodesTo) GraphCool.Object.AddToVenueOfEventPayload
venuesVenue object =
    Object.selectionField "venuesVenue" [] object (identity >> Decode.nullable)
