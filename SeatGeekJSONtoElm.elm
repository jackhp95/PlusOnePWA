import Json.Encode
import Json.Decode
import Json.Decode.Pipeline

type alias SeatGeek =
    { meta : SeatGeekMeta
    , events : List SeatGeekEvent
    }


type alias SeatGeekEvent =
    { score : Float
    , date_tbd : Bool
    , date_time : Bool
    , general_admission : Bool
    , visible_until_utc : String
    , performers : List SeatGeekPerformers
    , taxonomies : List SeatGeekTaxonomies
    , datetime_local : String
    , time_tbd : Bool
    , venue : SeatGeekVenue
    , url : String
    , popularity : Float
    , datetime_utc : String
    , created_at : String
    , is_open : Bool
    , links : List String
    , stats : SeatGeekStats
    , title : String
    , mainTaxonomy : String
    , uniqueID : Int
    , short_title : String
    , announce_date : String
    }


type alias SeatGeekPerformers =
    { score : Float
    , uniqueID : Int
    , colors : Maybe String
    , images : SeatGeekPerformerImages
    , imageLicense : Maybe String
    , image : Maybe String
    , slug : String
    , url : String
    , taxonomies : List SeatGeekTaxonomies
    , imageAttribution : Maybe String
    , hasUpcomingEvents : Bool
    , shortName : String
    , popularity : Int
    , stats : SeatGeekStats
    , name : String
    , primary : Bool
    , homeVenueId : Maybe Int
    , mainTaxonomy : String
    , divisions : Maybe List String
    , numUpcomingEvents : Int
    }


type alias SeatGeekMetaGeolocation =
    { state : String
    , country : String
    , range : String
    , postalCode : String
    , lat : Float
    , displayName : String
    , city : String
    , lon : Float
    }

type alias SeatGeekVenue =
    { city: String
    , name: String
    , extended_address: Maybe String
    , url: String
    , country: String
    , state: String
    , score: Float
    , postal_code: String
    , location: LatLon
    , address: String
    , id: Int
    }


type alias LatLon =
    { lat : Float
    , lon : Float
    }


type alias SeatGeekTaxonomies =
    { parentID : Maybe Int
    , uniqueID : Int
    , name : String
    }


type alias SeatGeekPerformerImages =
    { large: Maybe String
    , huge: Maybe String
    , small: Maybe String
    , medium: Maybe String
    }


type alias SeatGeekStats =
    {  listingCount : Maybe Int
    ,  averagePrice : Maybe Int
    ,  lowestPrice : Maybe Int
    ,  highestPrice : Maybe Int
    }


type alias SeatGeekMeta =
    { total : Int
    , perPage : Int
    , took : Int
    , geolocation : SeatGeekMetaGeolocation
    , page : Int
    }


decodeSeatGeek : Json.Decode.Decoder SeatGeek
decodeSeatGeek =
    Json.Decode.Pipeline.decode SeatGeek
        |> Json.Decode.Pipeline.required "meta" (decodeSeatGeekMeta)
        |> Json.Decode.Pipeline.required "events" (Json.Decode.list decodeSeatGeekEvent)


decodeSeatGeekEvent : Json.Decode.Decoder SeatGeekEvent
decodeSeatGeekEvent =
    Json.Decode.Pipeline.decode SeatGeekEvent
        |> Json.Decode.Pipeline.required "stats" (decodeSeatGeekStats)
        |> Json.Decode.Pipeline.required "title" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "url" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "datetimeLocal" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "performers" (Json.Decode.list decodeSeatGeekPerformers)
        |> Json.Decode.Pipeline.required "venue" (decodeSeatGeekVenue)
        |> Json.Decode.Pipeline.required "shortTitle" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "datetimeUtc" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "score" (Json.Decode.float)
        |> Json.Decode.Pipeline.required "taxonomies" (Json.Decode.list decodeSeatGeekTaxonomies)
        |> Json.Decode.Pipeline.required "type" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "id" (Json.Decode.int)


decodeSeatGeekVenue : Json.Decode.Decoder SeatGeekVenue
decodeSeatGeekVenue =
    Json.Decode.Pipeline.decode SeatGeekVenue
        |> Json.Decode.Pipeline.required "city" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "name" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "extendedAddress" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "url" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "country" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "state" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "score" (Json.Decode.float)
        |> Json.Decode.Pipeline.required "postalCode" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "location" (decodeLatLon)
        |> Json.Decode.Pipeline.required "address" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "id" (Json.Decode.int)


decodeSeatGeekPerformers : Json.Decode.Decoder SeatGeekPerformers
decodeSeatGeekPerformers =
    Json.Decode.Pipeline.decode SeatGeekPerformers
        |> Json.Decode.Pipeline.required "score" (Json.Decode.float)
        |> Json.Decode.Pipeline.required "uniqueID" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "colors" (Json.Decode.maybe Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "images" (Json.Decode.maybe Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "imageLicense" (Json.Decode.maybe Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "image" (Json.Decode.list Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "slug" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "url" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "taxonomies" (Json.Decode.list Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "imageAttribution" (Json.Decode.maybe Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "hasUpcomingEvents" (Json.Decode.bool)
        |> Json.Decode.Pipeline.required "shortName" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "popularity" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "stats" (Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "name" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "primary" (Json.Decode.bool)
        |> Json.Decode.Pipeline.required "homeVenueId" (Json.Decode.maybe Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "mainTaxonomy" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "divisions" (Json.Decode.maybe Json.Decode.Pipeline.decode)
        |> Json.Decode.Pipeline.required "numUpcomingEvents" (Json.Decode.int)


decodeSeatGeekTaxonomies : Json.Decode.Decoder SeatGeekTaxonomies
decodeSeatGeekTaxonomies =
    Json.Decode.Pipeline.decode SeatGeekTaxonomies
        |> Json.Decode.Pipeline.required "parent_id" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "id" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "name" (Json.Decode.string)

decodeSeatGeekStats : Json.Decode.Decoder SeatGeekStats
decodeSeatGeekStats =
    Json.Decode.Pipeline.decode SeatGeekStats
        |> Json.Decode.Pipeline.required "listingCount" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "averagePrice" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "lowestPrice" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "highestPrice" (Json.Decode.int)


decodeSeatGeekMetaGeolocation : Json.Decode.Decoder SeatGeekMetaGeolocation
decodeSeatGeekMetaGeolocation =
    Json.Decode.Pipeline.decode SeatGeekMetaGeolocation
        |> Json.Decode.Pipeline.required "state" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "country" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "range" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "postalCode" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "lat" (Json.Decode.float)
        |> Json.Decode.Pipeline.required "displayName" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "city" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "lon" (Json.Decode.float)

decodeLatLon : Json.Decode.Decoder LatLon
decodeLatLon =
    Json.Decode.Pipeline.decode LatLon
        |> Json.Decode.Pipeline.required "lat" (Json.Decode.float)
        |> Json.Decode.Pipeline.required "lon" (Json.Decode.float)

decodeSeatGeekMeta : Json.Decode.Decoder SeatGeekMeta
decodeSeatGeekMeta =
    Json.Decode.Pipeline.decode SeatGeekMeta
        |> Json.Decode.Pipeline.required "total" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "perPage" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "took" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "geolocation" (decodeSeatGeekMetaGeolocation)
        |> Json.Decode.Pipeline.required "page" (Json.Decode.int)
