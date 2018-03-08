-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Object.Location exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Object.Location
selection constructor =
    Object.selection constructor


address : Field (Maybe String) GraphCool.Object.Location
address =
    Object.fieldDecoder "address" [] (Decode.string |> Decode.maybe)


addressFull : Field (Maybe String) GraphCool.Object.Location
addressFull =
    Object.fieldDecoder "addressFull" [] (Decode.string |> Decode.maybe)


city : Field (Maybe String) GraphCool.Object.Location
city =
    Object.fieldDecoder "city" [] (Decode.string |> Decode.maybe)


country : Field (Maybe String) GraphCool.Object.Location
country =
    Object.fieldDecoder "country" [] (Decode.string |> Decode.maybe)


createdAt : Field GraphCool.Scalar.DateTime GraphCool.Object.Location
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map GraphCool.Scalar.DateTime)


id : Field GraphCool.Scalar.Id GraphCool.Object.Location
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map GraphCool.Scalar.Id)


lat : Field Float GraphCool.Object.Location
lat =
    Object.fieldDecoder "lat" [] Decode.float


lon : Field Float GraphCool.Object.Location
lon =
    Object.fieldDecoder "lon" [] Decode.float


state : Field String GraphCool.Object.Location
state =
    Object.fieldDecoder "state" [] Decode.string


{-|

  - filter -

-}
venue : ({ filter : OptionalArgument GraphCool.InputObject.VenueFilter } -> { filter : OptionalArgument GraphCool.InputObject.VenueFilter }) -> SelectionSet decodesTo GraphCool.Object.Venue -> Field (Maybe decodesTo) GraphCool.Object.Location
venue fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter GraphCool.InputObject.encodeVenueFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "venue" optionalArgs object (identity >> Decode.maybe)


zip : Field (Maybe String) GraphCool.Object.Location
zip =
    Object.fieldDecoder "zip" [] (Decode.string |> Decode.maybe)