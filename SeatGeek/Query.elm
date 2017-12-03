module SeatGeek.Query exposing (..)

import SeatGeek.Types as SG
import Types
import SeatGeek.Decode exposing (decodeReply)
import Http exposing (..)


composeArgument : String -> String -> String
composeArgument name value =
    case value of
        "" ->
            ""

        _ ->
            "&" ++ name ++ "=" ++ value


composeRequest : SG.Query -> String
composeRequest query =
    let
        url =
            "https://api.seatgeek.com/2/"

        start =
            ("?" ++ "client_id=" ++ query.client_id)
                ++ "&postal_code=65203&per_page=30"
                ++ (composeArgument "aid" query.aid)
                ++ (composeArgument "rid" query.rid)

        --     , geoip = ""
        -- , lat = ""
        -- , lon = ""
        -- , range = ""
        -- , per_page = ""
        -- , page = ""
        -- , sort = { field = Datetime_utc, direction = Asc }
    in
        case query.endpoint of
            SG.Events Nothing ->
                url ++ "events" ++ start

            SG.Events (Just id) ->
                url ++ "events/" ++ id ++ start

            SG.Performers Nothing ->
                url ++ "performers" ++ start

            SG.Performers (Just id) ->
                url ++ "performers/" ++ id ++ start

            SG.Venues Nothing ->
                url ++ "venues" ++ start

            SG.Venues (Just id) ->
                url ++ "venues/" ++ id ++ start

            SG.Recommendations ->
                url ++ "recommendations" ++ start

            SG.Taxonomies ->
                url ++ "taxonomies" ++ start

            SG.Genres ->
                url ++ "genres" ++ start


askQuery : SG.Query -> Cmd Types.Msg
askQuery query =
    let
        url =
            composeRequest query

        request =
            Http.get url decodeReply
    in
        Http.send Types.GetReply request
