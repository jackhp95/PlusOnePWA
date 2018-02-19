-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Interface.Node exposing (..)

import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (FragmentSelectionSet(FragmentSelectionSet), SelectionSet(SelectionSet))
import Json.Decode as Decode
import PlusOne.InputObject
import PlusOne.Interface
import PlusOne.Object
import PlusOne.Scalar
import PlusOne.Union


{-| Select only common fields from the interface.
-}
commonSelection : (a -> constructor) -> SelectionSet (a -> constructor) PlusOne.Interface.Node
commonSelection constructor =
    Object.selection constructor


{-| Select both common and type-specific fields from the interface.
-}
selection : (Maybe typeSpecific -> a -> constructor) -> List (FragmentSelectionSet typeSpecific PlusOne.Interface.Node) -> SelectionSet (a -> constructor) PlusOne.Interface.Node
selection constructor typeSpecificDecoders =
    Object.interfaceSelection typeSpecificDecoders constructor


onChat : SelectionSet decodesTo PlusOne.Object.Chat -> FragmentSelectionSet decodesTo PlusOne.Interface.Node
onChat (SelectionSet fields decoder) =
    FragmentSelectionSet "Chat" fields decoder


onEvent : SelectionSet decodesTo PlusOne.Object.Event -> FragmentSelectionSet decodesTo PlusOne.Interface.Node
onEvent (SelectionSet fields decoder) =
    FragmentSelectionSet "Event" fields decoder


onFile : SelectionSet decodesTo PlusOne.Object.File -> FragmentSelectionSet decodesTo PlusOne.Interface.Node
onFile (SelectionSet fields decoder) =
    FragmentSelectionSet "File" fields decoder


onHost : SelectionSet decodesTo PlusOne.Object.Host -> FragmentSelectionSet decodesTo PlusOne.Interface.Node
onHost (SelectionSet fields decoder) =
    FragmentSelectionSet "Host" fields decoder


onLocation : SelectionSet decodesTo PlusOne.Object.Location -> FragmentSelectionSet decodesTo PlusOne.Interface.Node
onLocation (SelectionSet fields decoder) =
    FragmentSelectionSet "Location" fields decoder


onMessage : SelectionSet decodesTo PlusOne.Object.Message -> FragmentSelectionSet decodesTo PlusOne.Interface.Node
onMessage (SelectionSet fields decoder) =
    FragmentSelectionSet "Message" fields decoder


onUser : SelectionSet decodesTo PlusOne.Object.User -> FragmentSelectionSet decodesTo PlusOne.Interface.Node
onUser (SelectionSet fields decoder) =
    FragmentSelectionSet "User" fields decoder


onVenue : SelectionSet decodesTo PlusOne.Object.Venue -> FragmentSelectionSet decodesTo PlusOne.Interface.Node
onVenue (SelectionSet fields decoder) =
    FragmentSelectionSet "Venue" fields decoder


{-| The id of the object.
-}
id : Field PlusOne.Scalar.Id PlusOne.Interface.Node
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map PlusOne.Scalar.Id)