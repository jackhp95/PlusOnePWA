-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Interface.Node exposing (..)

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
import Graphqelm.SelectionSet exposing (FragmentSelectionSet(FragmentSelectionSet), SelectionSet(SelectionSet))
import Json.Decode as Decode


{-| Select only common fields from the interface.
-}
commonSelection : (a -> constructor) -> SelectionSet (a -> constructor) GraphCool.Interface.Node
commonSelection constructor =
    Object.selection constructor


{-| Select both common and type-specific fields from the interface.
-}
selection : (Maybe typeSpecific -> a -> constructor) -> List (FragmentSelectionSet typeSpecific GraphCool.Interface.Node) -> SelectionSet (a -> constructor) GraphCool.Interface.Node
selection constructor typeSpecificDecoders =
    Object.interfaceSelection typeSpecificDecoders constructor


onChat : SelectionSet decodesTo GraphCool.Object.Chat -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onChat (SelectionSet fields decoder) =
    FragmentSelectionSet "Chat" fields decoder


onEvent : SelectionSet decodesTo GraphCool.Object.Event -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onEvent (SelectionSet fields decoder) =
    FragmentSelectionSet "Event" fields decoder


onFile : SelectionSet decodesTo GraphCool.Object.File -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onFile (SelectionSet fields decoder) =
    FragmentSelectionSet "File" fields decoder


onHost : SelectionSet decodesTo GraphCool.Object.Host -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onHost (SelectionSet fields decoder) =
    FragmentSelectionSet "Host" fields decoder


onLocation : SelectionSet decodesTo GraphCool.Object.Location -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onLocation (SelectionSet fields decoder) =
    FragmentSelectionSet "Location" fields decoder


onMessage : SelectionSet decodesTo GraphCool.Object.Message -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onMessage (SelectionSet fields decoder) =
    FragmentSelectionSet "Message" fields decoder


onPool : SelectionSet decodesTo GraphCool.Object.Pool -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onPool (SelectionSet fields decoder) =
    FragmentSelectionSet "Pool" fields decoder


onUser : SelectionSet decodesTo GraphCool.Object.User -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onUser (SelectionSet fields decoder) =
    FragmentSelectionSet "User" fields decoder


onVenue : SelectionSet decodesTo GraphCool.Object.Venue -> FragmentSelectionSet decodesTo GraphCool.Interface.Node
onVenue (SelectionSet fields decoder) =
    FragmentSelectionSet "Venue" fields decoder


{-| The id of the object.
-}
id : Field GraphCool.Scalar.Id GraphCool.Interface.Node
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map GraphCool.Scalar.Id)
