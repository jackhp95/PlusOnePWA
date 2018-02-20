-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module PlusOne.Enum.UserOrderBy exposing (..)

import Json.Decode as Decode exposing (Decoder)


type UserOrderBy
    = Auth0UserId_ASC
    | Auth0UserId_DESC
    | Bio_ASC
    | Bio_DESC
    | Birthday_ASC
    | Birthday_DESC
    | CreatedAt_ASC
    | CreatedAt_DESC
    | Email_ASC
    | Email_DESC
    | Id_ASC
    | Id_DESC
    | Name_ASC
    | Name_DESC
    | NameFull_ASC
    | NameFull_DESC
    | Password_ASC
    | Password_DESC
    | UpdatedAt_ASC
    | UpdatedAt_DESC


decoder : Decoder UserOrderBy
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "auth0UserId_ASC" ->
                        Decode.succeed Auth0UserId_ASC

                    "auth0UserId_DESC" ->
                        Decode.succeed Auth0UserId_DESC

                    "bio_ASC" ->
                        Decode.succeed Bio_ASC

                    "bio_DESC" ->
                        Decode.succeed Bio_DESC

                    "birthday_ASC" ->
                        Decode.succeed Birthday_ASC

                    "birthday_DESC" ->
                        Decode.succeed Birthday_DESC

                    "createdAt_ASC" ->
                        Decode.succeed CreatedAt_ASC

                    "createdAt_DESC" ->
                        Decode.succeed CreatedAt_DESC

                    "email_ASC" ->
                        Decode.succeed Email_ASC

                    "email_DESC" ->
                        Decode.succeed Email_DESC

                    "id_ASC" ->
                        Decode.succeed Id_ASC

                    "id_DESC" ->
                        Decode.succeed Id_DESC

                    "name_ASC" ->
                        Decode.succeed Name_ASC

                    "name_DESC" ->
                        Decode.succeed Name_DESC

                    "nameFull_ASC" ->
                        Decode.succeed NameFull_ASC

                    "nameFull_DESC" ->
                        Decode.succeed NameFull_DESC

                    "password_ASC" ->
                        Decode.succeed Password_ASC

                    "password_DESC" ->
                        Decode.succeed Password_DESC

                    "updatedAt_ASC" ->
                        Decode.succeed UpdatedAt_ASC

                    "updatedAt_DESC" ->
                        Decode.succeed UpdatedAt_DESC

                    _ ->
                        Decode.fail ("Invalid UserOrderBy type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : UserOrderBy -> String
toString enum =
    case enum of
        Auth0UserId_ASC ->
            "auth0UserId_ASC"

        Auth0UserId_DESC ->
            "auth0UserId_DESC"

        Bio_ASC ->
            "bio_ASC"

        Bio_DESC ->
            "bio_DESC"

        Birthday_ASC ->
            "birthday_ASC"

        Birthday_DESC ->
            "birthday_DESC"

        CreatedAt_ASC ->
            "createdAt_ASC"

        CreatedAt_DESC ->
            "createdAt_DESC"

        Email_ASC ->
            "email_ASC"

        Email_DESC ->
            "email_DESC"

        Id_ASC ->
            "id_ASC"

        Id_DESC ->
            "id_DESC"

        Name_ASC ->
            "name_ASC"

        Name_DESC ->
            "name_DESC"

        NameFull_ASC ->
            "nameFull_ASC"

        NameFull_DESC ->
            "nameFull_DESC"

        Password_ASC ->
            "password_ASC"

        Password_DESC ->
            "password_DESC"

        UpdatedAt_ASC ->
            "updatedAt_ASC"

        UpdatedAt_DESC ->
            "updatedAt_DESC"
