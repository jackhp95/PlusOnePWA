module SeatGeek.Types exposing (..)

import GraphCool.Scalar exposing (..)


type alias SeatGeek =
    { reply : Reply
    , query : Query
    }



-- REPLY --


type alias Reply =
    { meta : ReplyMeta
    , events : List Event
    }


type alias MetaGeolocation =
    { state : String
    , postal_code : String
    , lat : Float
    , range : String
    , display_name : String
    , city : String
    , country : String
    , lon : Float
    }


type alias ReplyMeta =
    { per_page : Int
    , took : Int

    -- , geolocation : MetaGeolocation
    , total : Int
    , page : Int
    }


type alias Event =
    { datetime_utc : String
    , visible_until_utc : String
    , datetime_local : String
    , time_tbd : Bool
    , taxonomies : List Taxonomy
    , category : String

    --, links : Maybe List ComplexType
    , created_at : String
    , performers : List Performer
    , score : Float
    , short_title : String
    , venue : Venue
    , id : Id
    , stats : Tickets
    , date_tbd : Bool
    , title : String
    , popularity : Float
    , url : String
    , announce_date : String

    --, is_open : Maybe Bool
    }


type alias GCS =
    { lon : Float
    , lat : Float
    }


type alias Venue =
    { name : String
    , display_location : String
    , popularity : Float
    , extended_address : String
    , location : GCS
    , name_v2 : String

    -- , links : Maybe List ComplexType
    , state : Maybe String

    -- , has_upcoming_events : Maybe Bool
    , num_upcoming_events : Int
    , id : Int
    , slug : String
    , timezone : Maybe String
    , url : String
    , postal_code : String
    , city : String
    , country : String
    , score : Float
    , address : String
    }


type alias Tickets =
    { listing_count : Maybe Int
    , highest_price : Maybe Float
    , average_price : Maybe Float
    , lowest_price_good_deals : Maybe Float
    , lowest_price : Maybe Float
    }


type alias Performer =
    { image : Maybe String
    , images : List String
    , image_attribution : Maybe String
    , num_upcoming_events : Int
    , divisions : Maybe (List Division)
    , genres : Maybe (List Genre)
    , stats : PerformerStats
    , url : String
    , home_venue_id : Maybe Int
    , category : String
    , score : Float
    , slug : String
    , primary : Maybe Bool
    , colors : Maybe PerformerColor
    , image_license : Maybe String
    , name : String

    -- , has_upcoming_events : Maybe Bool
    , popularity : Float
    , taxonomies : List Taxonomy
    , id : Int
    , short_name : String
    }


type alias PerformerColor =
    { primary : List String
    , all : List String
    , iconic : String
    }


type alias PerformerStats =
    { event_count : Int
    }


type alias TaxonomyStats =
    { performer_count : Int
    , event_count : Int
    }


type alias Taxonomy =
    { images : List String
    , name : String
    , short_name : Maybe String
    , parent_id : Maybe Int
    , stats : Maybe TaxonomyStats
    , id : Int
    , slug : Maybe String
    , image : Maybe String
    , is_visible : Maybe Bool
    }


type alias Genre =
    { slug : String
    , name : String
    , image : Maybe String
    , id : Int
    , images : List String
    }


type alias Division =
    { display_type : String
    , short_name : Maybe String
    , display_name : String
    , division_level : Int
    , slug : Maybe String
    , taxonomy_id : Int
    }



-- QUERY --


type alias Query =
    { endpoint : Endpoint
    , arguments : Arguments
    , geoip : String
    , lat : String
    , lon : String
    , range : String
    , per_page : String
    , page : String
    , sort : SortArguments
    , aid : String
    , rid : String
    , client_id : String
    }


initQuery : Query
initQuery =
    { endpoint = Events Nothing
    , arguments = initArguments
    , geoip = ""
    , lat = ""
    , lon = ""
    , range = ""
    , per_page = ""
    , page = ""
    , sort = { field = Datetime_utc, direction = Asc }
    , aid = ""
    , rid = ""
    , client_id = "MzUwNDE1NnwxNDgxNjA1ODM2"
    }


type Endpoint
    = Events (Maybe String)
    | Performers (Maybe String)
    | Venues (Maybe String)
    | Recommendations
    | Taxonomies
    | Genres


type alias Arguments =
    { performers : String
    , venues : String
    , datetime : String
    , query : String
    , id : String
    , taxonomies : String
    , slug : String
    , genres : String
    , city : String
    , state : String
    , country : String
    , postal_code : String
    }


initArguments : Arguments
initArguments =
    { performers = ""
    , venues = ""
    , datetime = ""
    , query = ""
    , id = ""
    , taxonomies = ""
    , slug = ""
    , genres = ""
    , city = ""
    , state = ""
    , country = ""
    , postal_code = ""
    }


type alias SortArguments =
    { field : SortField
    , direction : SortDirection
    }


type SortField
    = Datetime_local
    | Datetime_utc
    | Announce_date


type SortDirection
    = Asc
    | Desc
