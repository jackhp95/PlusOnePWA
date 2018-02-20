-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Object.Message exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) PlusOne.Object.Message
selection constructor =
    Object.selection constructor


{-|

  - filter -

-}
chat : ({ filter : OptionalArgument PlusOne.InputObject.ChatFilter } -> { filter : OptionalArgument PlusOne.InputObject.ChatFilter }) -> SelectionSet decodesTo PlusOne.Object.Chat -> Field decodesTo PlusOne.Object.Message
chat fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter PlusOne.InputObject.encodeChatFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "chat" optionalArgs object identity


createdAt : Field PlusOne.Scalar.DateTime PlusOne.Object.Message
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map PlusOne.Scalar.DateTime)


{-|

  - filter -

-}
from : ({ filter : OptionalArgument PlusOne.InputObject.UserFilter } -> { filter : OptionalArgument PlusOne.InputObject.UserFilter }) -> SelectionSet decodesTo PlusOne.Object.User -> Field (Maybe decodesTo) PlusOne.Object.Message
from fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { filter = Absent }

        optionalArgs =
            [ Argument.optional "filter" filledInOptionals.filter PlusOne.InputObject.encodeUserFilter ]
                |> List.filterMap identity
    in
    Object.selectionField "from" optionalArgs object (identity >> Decode.maybe)


id : Field PlusOne.Scalar.Id PlusOne.Object.Message
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map PlusOne.Scalar.Id)


text : Field String PlusOne.Object.Message
text =
    Object.fieldDecoder "text" [] Decode.string
