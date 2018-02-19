-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Enum.LocationOrderBy exposing (..)

import Json.Decode as Decode exposing (Decoder)


type LocationOrderBy
    = Address_ASC
    | Address_DESC
    | AddressFull_ASC
    | AddressFull_DESC
    | City_ASC
    | City_DESC
    | Country_ASC
    | Country_DESC
    | CreatedAt_ASC
    | CreatedAt_DESC
    | Id_ASC
    | Id_DESC
    | Lat_ASC
    | Lat_DESC
    | Lon_ASC
    | Lon_DESC
    | State_ASC
    | State_DESC
    | Zip_ASC
    | Zip_DESC


decoder : Decoder LocationOrderBy
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "address_ASC" ->
                        Decode.succeed Address_ASC

                    "address_DESC" ->
                        Decode.succeed Address_DESC

                    "addressFull_ASC" ->
                        Decode.succeed AddressFull_ASC

                    "addressFull_DESC" ->
                        Decode.succeed AddressFull_DESC

                    "city_ASC" ->
                        Decode.succeed City_ASC

                    "city_DESC" ->
                        Decode.succeed City_DESC

                    "country_ASC" ->
                        Decode.succeed Country_ASC

                    "country_DESC" ->
                        Decode.succeed Country_DESC

                    "createdAt_ASC" ->
                        Decode.succeed CreatedAt_ASC

                    "createdAt_DESC" ->
                        Decode.succeed CreatedAt_DESC

                    "id_ASC" ->
                        Decode.succeed Id_ASC

                    "id_DESC" ->
                        Decode.succeed Id_DESC

                    "lat_ASC" ->
                        Decode.succeed Lat_ASC

                    "lat_DESC" ->
                        Decode.succeed Lat_DESC

                    "lon_ASC" ->
                        Decode.succeed Lon_ASC

                    "lon_DESC" ->
                        Decode.succeed Lon_DESC

                    "state_ASC" ->
                        Decode.succeed State_ASC

                    "state_DESC" ->
                        Decode.succeed State_DESC

                    "zip_ASC" ->
                        Decode.succeed Zip_ASC

                    "zip_DESC" ->
                        Decode.succeed Zip_DESC

                    _ ->
                        Decode.fail ("Invalid LocationOrderBy type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : LocationOrderBy -> String
toString enum =
    case enum of
        Address_ASC ->
            "address_ASC"

        Address_DESC ->
            "address_DESC"

        AddressFull_ASC ->
            "addressFull_ASC"

        AddressFull_DESC ->
            "addressFull_DESC"

        City_ASC ->
            "city_ASC"

        City_DESC ->
            "city_DESC"

        Country_ASC ->
            "country_ASC"

        Country_DESC ->
            "country_DESC"

        CreatedAt_ASC ->
            "createdAt_ASC"

        CreatedAt_DESC ->
            "createdAt_DESC"

        Id_ASC ->
            "id_ASC"

        Id_DESC ->
            "id_DESC"

        Lat_ASC ->
            "lat_ASC"

        Lat_DESC ->
            "lat_DESC"

        Lon_ASC ->
            "lon_ASC"

        Lon_DESC ->
            "lon_DESC"

        State_ASC ->
            "state_ASC"

        State_DESC ->
            "state_DESC"

        Zip_ASC ->
            "zip_ASC"

        Zip_DESC ->
            "zip_DESC"