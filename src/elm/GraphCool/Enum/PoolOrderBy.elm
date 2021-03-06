-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module GraphCool.Enum.PoolOrderBy exposing (..)

import Json.Decode as Decode exposing (Decoder)


type PoolOrderBy
    = Id_ASC
    | Id_DESC
    | SeatGeekId_ASC
    | SeatGeekId_DESC


decoder : Decoder PoolOrderBy
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "id_ASC" ->
                        Decode.succeed Id_ASC

                    "id_DESC" ->
                        Decode.succeed Id_DESC

                    "seatGeekId_ASC" ->
                        Decode.succeed SeatGeekId_ASC

                    "seatGeekId_DESC" ->
                        Decode.succeed SeatGeekId_DESC

                    _ ->
                        Decode.fail ("Invalid PoolOrderBy type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : PoolOrderBy -> String
toString enum =
    case enum of
        Id_ASC ->
            "id_ASC"

        Id_DESC ->
            "id_DESC"

        SeatGeekId_ASC ->
            "seatGeekId_ASC"

        SeatGeekId_DESC ->
            "seatGeekId_DESC"
