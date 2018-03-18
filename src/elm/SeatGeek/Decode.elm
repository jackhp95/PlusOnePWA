-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html


module SeatGeek.Decode exposing (..)

import GraphCool.Scalar exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Extra exposing ((|:))
import SeatGeek.Types as SG
import Types


(:=) =
    Json.Decode.field


(?) =
    Maybe.withDefault



-- DECODERS --


decodeGenre : Json.Decode.Decoder SG.Genre
decodeGenre =
    Json.Decode.succeed SG.Genre
        |: ("slug" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: Json.Decode.maybe ("image" := Json.Decode.string)
        |: ("id" := Json.Decode.int)
        |: Json.Decode.Extra.withDefault [] ("images" := Json.Decode.Extra.collection Json.Decode.string)


decodeDivision : Json.Decode.Decoder SG.Division
decodeDivision =
    Json.Decode.succeed SG.Division
        |: ("display_type" := Json.Decode.string)
        |: Json.Decode.maybe ("short_name" := Json.Decode.string)
        |: ("display_name" := Json.Decode.string)
        |: ("division_level" := Json.Decode.int)
        |: Json.Decode.maybe ("slug" := Json.Decode.string)
        |: ("taxonomy_id" := Json.Decode.int)


decodeTaxonomy : Json.Decode.Decoder SG.Taxonomy
decodeTaxonomy =
    Json.Decode.succeed SG.Taxonomy
        |: Json.Decode.Extra.withDefault [] ("images" := Json.Decode.Extra.collection Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: Json.Decode.maybe ("short_name" := Json.Decode.string)
        |: Json.Decode.maybe ("parent_id" := Json.Decode.int)
        |: Json.Decode.maybe ("stats" := decodeTaxonomyStats)
        |: ("id" := Json.Decode.int)
        |: Json.Decode.maybe ("slug" := Json.Decode.string)
        |: Json.Decode.maybe ("image" := Json.Decode.string)
        |: Json.Decode.maybe ("is_visible" := Json.Decode.bool)


decodeTaxonomyStats : Json.Decode.Decoder SG.TaxonomyStats
decodeTaxonomyStats =
    Json.Decode.succeed SG.TaxonomyStats
        |: ("performer_count" := Json.Decode.int)
        |: ("event_count" := Json.Decode.int)


decodePerformerStats : Json.Decode.Decoder SG.PerformerStats
decodePerformerStats =
    Json.Decode.succeed SG.PerformerStats
        |: ("event_count" := Json.Decode.int)


decodePerformerColor : Json.Decode.Decoder SG.PerformerColor
decodePerformerColor =
    Json.Decode.succeed SG.PerformerColor
        |: ("primary" := Json.Decode.list Json.Decode.string)
        |: ("all" := Json.Decode.list Json.Decode.string)
        |: ("iconic" := Json.Decode.string)


decodePerformer : Json.Decode.Decoder SG.Performer
decodePerformer =
    Json.Decode.succeed SG.Performer
        |: Json.Decode.maybe ("image" := Json.Decode.string)
        |: Json.Decode.Extra.withDefault [] ("images" := Json.Decode.Extra.collection Json.Decode.string)
        |: Json.Decode.maybe ("image_attribution" := Json.Decode.string)
        |: ("num_upcoming_events" := Json.Decode.int)
        |: Json.Decode.maybe ("divisions" := Json.Decode.list decodeDivision)
        |: Json.Decode.maybe ("genres" := Json.Decode.list decodeGenre)
        |: ("stats" := decodePerformerStats)
        |: ("url" := Json.Decode.string)
        |: Json.Decode.maybe ("home_venue_id" := Json.Decode.int)
        |: ("type" := Json.Decode.string)
        |: Json.Decode.Extra.withDefault 0.0 ("score" := Json.Decode.float)
        |: ("slug" := Json.Decode.string)
        |: Json.Decode.maybe ("primary" := Json.Decode.bool)
        |: Json.Decode.maybe ("colors" := decodePerformerColor)
        |: Json.Decode.maybe ("image_license" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        -- |: ("has_upcoming_events" := Json.Decode.bool)
        |: ("popularity" := Json.Decode.float)
        |: ("taxonomies" := Json.Decode.list decodeTaxonomy)
        |: ("id" := Json.Decode.int)
        |: ("short_name" := Json.Decode.string)


decodeEvent : Json.Decode.Decoder SG.Event
decodeEvent =
    Json.Decode.succeed SG.Event
        |: ("datetime_utc" := Json.Decode.string)
        |: ("visible_until_utc" := Json.Decode.string)
        |: ("datetime_local" := Json.Decode.string)
        |: ("time_tbd" := Json.Decode.bool)
        |: ("taxonomies" := Json.Decode.list decodeTaxonomy)
        |: ("type" := Json.Decode.string)
        -- |: Json.Decode.maybe ("links" := Json.Decode.list decodeComplexType)
        |: ("created_at" := Json.Decode.string)
        |: ("performers" := Json.Decode.list decodePerformer)
        |: Json.Decode.Extra.withDefault 0.0 ("score" := Json.Decode.float)
        |: ("short_title" := Json.Decode.string)
        |: ("venue" := decodeVenue)
        |: ("id" := Json.Decode.int |> Json.Decode.map (\int -> Id (toString int)))
        |: ("stats" := decodeTickets)
        |: ("date_tbd" := Json.Decode.bool)
        |: ("title" := Json.Decode.string)
        |: ("popularity" := Json.Decode.float)
        |: ("url" := Json.Decode.string)
        |: ("announce_date" := Json.Decode.string)



-- |: Json.Decode.maybe ("is_open" := Json.Decode.bool)--}


decodeGCS : Json.Decode.Decoder SG.GCS
decodeGCS =
    Json.Decode.succeed SG.GCS
        |: ("lon" := Json.Decode.float)
        |: ("lat" := Json.Decode.float)


decodeVenue : Json.Decode.Decoder SG.Venue
decodeVenue =
    Json.Decode.succeed SG.Venue
        |: ("name" := Json.Decode.string)
        |: ("display_location" := Json.Decode.string)
        |: ("popularity" := Json.Decode.float)
        |: ("extended_address" := Json.Decode.string)
        |: ("location" := decodeGCS)
        |: ("name_v2" := Json.Decode.string)
        -- |: Json.Decode.maybe ("links" := Json.Decode.list decodeComplexType)
        |: Json.Decode.maybe ("state" := Json.Decode.string)
        -- |: Json.Decode.maybe ("has_upcoming_events" := Json.Decode.bool)
        |: ("num_upcoming_events" := Json.Decode.int)
        |: ("id" := Json.Decode.int)
        |: ("slug" := Json.Decode.string)
        |: Json.Decode.maybe ("timezone" := Json.Decode.string)
        |: ("url" := Json.Decode.string)
        |: ("postal_code" := Json.Decode.string)
        |: ("city" := Json.Decode.string)
        |: ("country" := Json.Decode.string)
        |: ("score" := Json.Decode.float)
        |: ("address" := Json.Decode.string)


decodeTickets : Json.Decode.Decoder SG.Tickets
decodeTickets =
    Json.Decode.succeed SG.Tickets
        |: Json.Decode.maybe ("listing_count" := Json.Decode.int)
        |: Json.Decode.maybe ("highest_price" := Json.Decode.float)
        |: Json.Decode.maybe ("average_price" := Json.Decode.float)
        |: Json.Decode.maybe ("lowest_price_good_deals" := Json.Decode.float)
        |: Json.Decode.maybe ("lowest_price" := Json.Decode.float)


decodeReply : Json.Decode.Decoder SG.Reply
decodeReply =
    Json.Decode.succeed SG.Reply
        |: ("meta" := decodeReplyMeta)
        |: ("events" := Json.Decode.list decodeEvent)


decodeMetaGeolocation : Json.Decode.Decoder SG.MetaGeolocation
decodeMetaGeolocation =
    Json.Decode.succeed SG.MetaGeolocation
        |: ("state" := Json.Decode.string)
        |: ("postal_code" := Json.Decode.string)
        |: ("lat" := Json.Decode.float)
        |: ("range" := Json.Decode.string)
        |: ("display_name" := Json.Decode.string)
        |: ("city" := Json.Decode.string)
        |: ("country" := Json.Decode.string)
        |: ("lon" := Json.Decode.float)


decodeReplyMeta : Json.Decode.Decoder SG.ReplyMeta
decodeReplyMeta =
    Json.Decode.succeed SG.ReplyMeta
        |: ("per_page" := Json.Decode.int)
        |: ("took" := Json.Decode.int)
        -- |: ("geolocation" := decodeMetaGeolocation)
        |: ("total" := Json.Decode.int)
        |: ("page" := Json.Decode.int)



-- VIEW
-- view : Model -> Html Msg
-- view model =
--     div []
--         [ div [] (metaView model.reply)
--         , div [] (List.map eventView model.reply.events)
--         , div [] [ button [ Html.Events.onClick Discover ] [ text "discover" ] ]
--         ]
-- metaView : Reply -> List (Html.Html msg)
-- metaView model =
--     [ span [] [ text (" per page : " ++ toString model.meta.per_page) ]
--     , span [] [ text (" decoded : " ++ toString (List.length model.events)) ]
--     ]
-- eventView : Event -> Html msg
-- eventView event =
--     dl [ class "ba pa3 ma2" ]
--         [ dt [] [ text "Title" ]
--         , dd [] [ text event.title ]
--         , dt [] [ text "Short Title" ]
--         , dd [] [ text event.short_title ]
--         , div [] (List.map eventPerformerView event.performers)
--         , dt [] [ text "ID" ]
--         , dd [] [ text (toString event.id) ]
--         , dt [] [ text "Score" ]
--         , dd [] [ text (toString event.score) ]
--         , dt [] [ text "Type of event" ]
--         , dd [] [ text event.category ]
--         , eventVenueView event.venue
--         , dt [] [ text "Datetime Local" ]
--         , dd [] [ text event.datetime_local ]
--         , dt [] [ text "UTC Start" ]
--         , dd [] [ text event.datetime_utc ]
--         , dt [] [ text "UTC End" ]
--         , dd [] [ text event.visible_until_utc ]
--         , dt [] [ text "Creation Time" ]
--         , dd [] [ text event.created_at ]
--         , dt [] [ text "Announce Date" ]
--         , dd [] [ text event.announce_date ]
--         , dt [] [ text "Estimated Time" ]
--         , dd [] [ text (toString event.time_tbd) ]
--         , dt [] [ text "Estimated Date" ]
--         , dd [] [ text (toString event.date_tbd) ]
--         , dl [ class "ba pa3 ma2" ] (eventStatsView event.stats)
--         , dt [] [ text "Popularity" ]
--         , dd [] [ text (toString event.popularity) ]
--         , dt [] [ text "URL" ]
--         , dd [] [ text event.url ]
--         , div [] (List.map taxonomyView event.taxonomies)
--         ]
-- eventStatsView : Tickets -> List (Html msg)
-- eventStatsView stats =
--     (eventStatsIntView stats.listing_count "Listing Count"
--         ++ eventStatsFloatView stats.highest_price "highest price"
--         ++ eventStatsFloatView stats.average_price "average price"
--         ++ eventStatsFloatView stats.lowest_price "lowest price"
--         ++ eventStatsFloatView stats.lowest_price_good_deals "lowest price good deals"
--     )
-- eventStatsIntView : Maybe Int -> String -> List (Html msg)
-- eventStatsIntView number string =
--     case number of
--         Nothing ->
--             []
--         Just 0 ->
--             []
--         Just number ->
--             [ dt [] [ text string ]
--             , dd [] [ text (toString number) ]
--             ]
-- eventStatsFloatView : Maybe Float -> String -> List (Html msg)
-- eventStatsFloatView number string =
--     case number of
--         Nothing ->
--             []
--         Just number ->
--             [ dt [] [ text string ]
--             , dd [] [ text ("$" ++ (toString number)) ]
--             ]
-- colorBackgroundView : Maybe PerformerColor -> Attribute msg
-- colorBackgroundView colors =
--     case colors of
--         Nothing ->
--             style []
--         Just colors ->
--             style [ ( "backgroundColor", colors.iconic ) ]
-- eventPerformerView : Performer -> Html msg
-- eventPerformerView performer =
--     dl [ class "ba pa3 ma2", colorBackgroundView performer.colors ]
--         [ dt [] [ text "Performer Image" ]
--         , performer.image |> Maybe.map (\url -> img [ src url ] []) |> Maybe.withDefault (text "no image homie")
--         , dt [] [ text "name" ]
--         , dd [] [ text performer.name ]
--         , dt [] [ text "short name" ]
--         , dd [] [ text performer.short_name ]
--         , dt [] [ text "image attribution" ]
--         , dd [] [ text (Maybe.withDefault "IDK, There ain't no image attribution tho" performer.image_attribution) ]
--         , performerDivisionsView performer.divisions
--         , dt [] [ text "url" ]
--         , dd [] [ text performer.url ]
--         , dt [] [ text "category" ]
--         , dd [] [ text performer.category ]
--         , dt [] [ text "slug" ]
--         , dd [] [ text performer.slug ]
--         , dt [] [ text "image license" ]
--         , dd [] [ text (Maybe.withDefault "IDK, There ain't no image license tho" performer.image_license) ]
--         , dt [] [ text "num_upcoming_events" ]
--         , dd [] [ text (toString performer.num_upcoming_events) ]
--         , dt [] [ text "Primary" ]
--         , dd [] [ text (toString (Maybe.withDefault False performer.primary)) ]
--         , dt [] [ text "popularity" ]
--         , dd [] [ text (toString performer.popularity) ]
--         , dt [] [ text "ID" ]
--         , dd [] [ text (toString performer.id) ]
--         , dt [] [ text "Home Venue ID" ]
--         , dd [] [ text (toString performer.home_venue_id) ]
--         , div [] (List.map taxonomyView performer.taxonomies)
--         , performerStatsView performer.stats
--         , imagesView performer.images
--         ]
-- imagesView : List String -> Html msg
-- imagesView images =
--     div [ class "ba pa3 ma2 b--red" ] (List.map (\url -> img [ src url ] []) images)
-- performerDivisionsView : Maybe (List Division) -> Html msg
-- performerDivisionsView divisions =
--     case divisions of
--         Nothing ->
--             div [] []
--         Just divisions ->
--             div [] (List.map performerDivisionView divisions)
-- performerDivisionView : Division -> Html msg
-- performerDivisionView division =
--     div [ class "ba pa3 ma2 b--red" ]
--         [ div [] [ text ("display_type: " ++ (toString division.display_type)) ]
--         , div [] [ text ("short_name: " ++ (toString division.short_name)) ]
--         , div [] [ text ("display_name: " ++ (toString division.display_name)) ]
--         , div [] [ text ("division_level: " ++ (toString division.division_level)) ]
--         , div [] [ text ("slug: " ++ (toString division.slug)) ]
--         , div [] [ text ("taxonomy_id: " ++ (toString division.taxonomy_id)) ]
--         ]
-- eventVenueLocationView : GCS -> Html msg
-- eventVenueLocationView location =
--     dl [ class "ba pa3 ma2" ]
--         [ dt [] [ text "Latitude" ]
--         , dd [] [ text (toString location.lat) ]
--         , dt [] [ text "Longitude" ]
--         , dd [] [ text (toString location.lon) ]
--         ]
-- eventVenueView : Venue -> Html msg
-- eventVenueView venue =
--     dl [ class "ba pa3 ma2" ]
--         [ dt [] [ text "Venue Name" ]
--         , dd [] [ text venue.name ]
--         , dt [] [ text "Display Location" ]
--         , dd [] [ text venue.display_location ]
--         , dt [] [ text "Extended Address" ]
--         , dd [] [ text venue.extended_address ]
--         , dt [] [ text "Name V2" ]
--         , dd [] [ text venue.name_v2 ]
--         , dt [] [ text "State" ]
--         , dd [] [ text (Maybe.withDefault "no state provided" venue.state) ]
--         , dt [] [ text "Slug" ]
--         , dd [] [ text venue.slug ]
--         , dt [] [ text "Timezone" ]
--         , dd [] [ text (toString venue.timezone) ]
--         , dt [] [ text "Site" ]
--         , dd [] [ text venue.url ]
--         , dt [] [ text "Postal Code" ]
--         , dd [] [ text venue.postal_code ]
--         , dt [] [ text "City" ]
--         , dd [] [ text venue.city ]
--         , dt [] [ text "Country" ]
--         , dd [] [ text venue.country ]
--         , dt [] [ text "Address" ]
--         , dd [] [ text venue.address ]
--         , eventVenueLocationView venue.location
--         , dt [] [ text "Popularity" ]
--         , dd [] [ text (toString venue.popularity) ]
--         , dt [] [ text "Score" ]
--         , dd [] [ text (toString venue.score) ]
--         , dt [] [ text "ID" ]
--         , dd [] [ text (toString venue.id) ]
--         , dt [] [ text "num upcoming events" ]
--         , dd [] [ text (toString venue.num_upcoming_events) ]
--         ]
-- taxonomyView : Taxonomy -> Html msg
-- taxonomyView taxonomy =
--     dl [ class "ba pa3 ma2" ]
--         [ dt [] [ text "ID" ]
--         , dd [] [ text (toString taxonomy.id) ]
--         , dt [] [ text "Parent ID" ]
--         , dd [] [ text (toString taxonomy.parent_id) ]
--         , dt [] [ text "Name" ]
--         , dd [] [ text taxonomy.name ]
--         ]
-- performerStatsView : PerformerStats -> Html msg
-- performerStatsView stats =
--     dl [ class "ba pa3 ma2" ]
--         [ dt [] [ text "Performer Event Count Stats" ]
--         , dd [] [ text (toString stats.event_count) ]
--         ]
