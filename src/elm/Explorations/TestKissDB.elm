module TestHelpers.KissDB exposing (main)

import EveryDict exposing (..)
import Graphqelm.Document as Document
import Helpers.KissDB as DB exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Update exposing (..)


init : ( Model, Cmd Types.Msg )
init =
    ( emptyModel
    , requestEverything
    )


view : Model -> Html Msg
view model =
    let
        toDiv x =
            div [ style [ ( "padding", "1em" ) ] ] [ text <| Basics.toString x ]

        response =
            div []
                [ div []
                    [ h5 [] [ text "Host" ]
                    , div [] (List.map toDiv <| EveryDict.values model.hosts)
                    ]
                , div []
                    [ h5 [] [ text "Venues" ]
                    , div [] (List.map toDiv <| EveryDict.values model.venues)
                    ]
                , div []
                    [ h5 [] [ text "Locations" ]
                    , div [] (List.map toDiv <| EveryDict.values model.locations)
                    ]
                , div []
                    [ h5 [] [ text "Events" ]
                    , div [] (List.map toDiv <| EveryDict.values model.events)
                    ]
                , div []
                    [ h5 [] [ text "Messages" ]
                    , div [] (List.map toDiv <| EveryDict.values model.messages)
                    ]
                , div []
                    [ h5 [] [ text "Chats" ]
                    , div [] (List.map toDiv <| EveryDict.values model.chats)
                    ]
                , div []
                    [ h5 [] [ text "Users" ]
                    , div [] (List.map toDiv <| EveryDict.values model.users)
                    ]
                , div []
                    [ h5 [] [ text "Me" ]
                    , div [] [ text <| Basics.toString <| model.me ]
                    ]
                ]
    in
    div []
        [ div []
            [ h1 [] [ text "Generated Query" ]
            , pre [] [ text (Document.serializeQuery everythingQuery) ]
            ]
        , div []
            [ h1 [] [ text "Generated Mutation" ]
            , pre [] [ text (Document.serializeMutation updateUserMutation) ]
            ]
        , div []
            [ h1 [] [ text "Model" ]
            , h2 [] [ text "Refined" ]
            , response
            , h2 [] [ text "Raw" ]
            , Html.text (Basics.toString model)
            ]
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = Update.update
        , subscriptions = \_ -> Sub.none
        , view = view
        }



-- ------------------- --
-- Everything Filtered --
-- ------------------- --
-- {
--   allHosts {
--     createdAt
--     description
--     events {
--       id
--     }
--     id
--     name
--     nameFull
--     users {
--       id
--     }
--     venues {
--       id
--     }
--   }
--   allVenues {
--     createdAt
--     description
--     id
--     name
--     nameFull
--   }
--   allLocations {
--     address
--     addressFull
--     city
--     country
--     createdAt
--     id
--     lat
--     lon
--     state
--     venue {
--       id
--     }
--     zip
--   }
--   allEvents {
--     pool {
--       id
--     }
--     createdAt
--     createdBy {
--       id
--     }
--     endsAt
--     hosts {
--       id
--     }
--     id
--     name
--     nameFull
--     private
--     startsAt
--     venues {
--       id
--     }
--   }
--   allPools {
--     chats {
--       id
--     }
--     event {
--       id
--     }
--     id
--     seatGeekId
--     attending {
--       id
--     }
--     liked {
--       id
--     }
--     viewed {
--       id
--     }
--   }
--   allMessages
--   (filter:
--     {chat: { OR :
--       [ {recipient: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       , {initiated: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       ]
--     }}
--   ){
--     chat {
--       id
--     }
--     createdAt
--     from {
--       id
--     }
--     id
--     text
--   }
--   allChats
--   (filter:
--     {OR:
--       [ {recipient: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       , {initiated: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       ]
--     }
--   ) {
--     canceled {
--       id
--     }
--     dateState
--     pool {
--       id
--     }
--     id
--     initiated {
--       id
--     }
--     messages {
--       id
--     }
--     passed {
--       id
--     }
--     proposed {
--       id
--     }
--     recipient {
--       id
--     }
--   }
--   allUsers
--   (filter:
--     {OR:
--       [ {recipient_some: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       , {initiated_some: {id: "cjepj0myaco5o0195eoyq7mcw"}}
--       , {attendingEvent_some:
--         	{ event:
--             { startsAt_gt : "2018-10-10T00:00:00.000Z"}
--           }
--       	}
--       ]
--     }
--   ) {
--     bio
--     birthday
--     createdAt
--     createdEvents {
--       id
--     }
--     email
--     attendingEvent {
--       id
--     }
--     likedEvent {
--       id
--     }
--     hosts {
--       id
--     }
--     id
--     name
--     nameFull
--     updatedAt
--   }
--   user {
--     auth0UserId
--     bio
--     birthday
--     createdAt
--     createdEvents {
--       id
--     }
--     datesCanceled {
--       id
--     }
--     email
--     attendingEvent {
--       id
--     }
--     likedEvent {
--       id
--     }
--     viewedEvent {
--       id
--     }
--     hosts {
--       id
--     }
--     id
--     initiated {
--       id
--     }
--     name
--     nameFull
--     passed {
--       id
--     }
--     password
--     proposed {
--       id
--     }
--     recipient {
--       id
--     }
--     sent {
--       id
--     }
--     updatedAt
--   }
-- }
