module Main exposing (..)

import GraphCool.Enum.DateState exposing (DateState)
import GraphCool.Object
import GraphCool.Object.Chat as Chat
import GraphCool.Object.Event as Event
import GraphCool.Object.Message as Message
import GraphCool.Object.User as User
import GraphCool.Query as Query
import GraphCool.Scalar exposing (..)
import Graphqelm.Document as Document
import Graphqelm.Http exposing (..)
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (..)
import RemoteData exposing (..)


-- query {
--  	  allMessages(filter : {
--      id_in : [
--             "cjd3nd13e1wv401643dwi1lxz"
--             , "cjd3ndc9m1yfo0135iq7frq3o"]
--     }) {
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
-- }
-- List Ids for messages [ Id "cjd3nd13e1wv401643dwi1lxz", Id "cjd3ndc9m1yfo0135iq7frq3o"]


type alias Response =
    { chats : List Chat
    }


type alias Chat =
    { canceled : Maybe String
    , dateState : DateState
    , event : String
    , id : Id
    , initiated : String
    , messages : Maybe (List String)
    , passed : Maybe String
    , proposed : Maybe String
    , recipient : Maybe String
    }



-- type alias Event =
--     { chats : Maybe (List Id)
--     , createdAt : DateTime
--     , createdBy : Id
--     , endsAt : Maybe DateTime
--     , hosts : Maybe (List Id)
--     , id : Id
--     , name : String
--     , nameFull : Maybe String
--     , private : Bool
--     , startsAt : DateTime
--     , usersAttending : Maybe (List Id)
--     , usersLiked : Maybe (List Id)
--     , usersViewed : Maybe (List Id)
--     , venues : Maybe (List Id)
-- }
-- type alias User =
--     { auth0UserId : Maybe String
--     , bio : Maybe String
--     , birthday : DateTime
--     , createdAt : DateTime
--     , createdEvents : Maybe (List Id)
--     , datesCanceled : Maybe (List Id)
--     , email : Maybe String
--     , eventsAttending : Maybe (List Id)
--     , eventsLiked : Maybe (List Id)
--     , eventsViewed : Maybe (List Id)
--     , hosts : Maybe (List Id)
--     , id : Id
--     , initiated : Maybe (List Id)
--     , name : String
--     , nameFull : Maybe String
--     , passed : Maybe (List Id)
--     , password : Maybe String
--     , proposed : Maybe (List Id)
--     , recipient : Maybe (List Id)
--     , sent : Maybe (List Id)
--     , updatedAt : DateTime
--     }
-- type alias Message =
--     { chat : Id
--     , createdAt : DateTime
--     , from : Maybe Id
--     , id : Id
--     , text : String
--     }


chat : SelectionSet Chat GraphCool.Object.Chat
chat =
    Chat.selection Chat
        |> with (Chat.canceled identity userName)
        |> with Chat.dateState
        |> with (Chat.event identity eventName)
        |> with Chat.id
        |> with (Chat.initiated identity userName)
        |> with (Chat.messages identity messageText)
        |> with (Chat.passed identity userName)
        |> with (Chat.proposed identity userName)
        |> with (Chat.recipient identity userName)


query : SelectionSet Response RootQuery
query =
    Query.selection Response
        -- |> with (Query.event ( \optionals -> { optionals | id = Present (Id "cjd171ftxbhmi0118pssihz2c")}) event)
        -- |> with (Query.allMessages (\optionals -> { optionals | filter = Present ( messageFilterIdList [ Id "cjd3nd13e1wv401643dwi1lxz", Id "cjd3ndc9m1yfo0135iq7frq3o"])}) message)
        |> with (Query.allChats identity chat)



-- messageFilterIdList : List Id -> MessageFilter
-- messageFilterIdList idList =
--     MessageFilter { and = Absent, or = Absent, createdAt = Absent, createdAt_not = Absent, createdAt_in = Absent, createdAt_not_in = Absent, createdAt_lt = Absent, createdAt_lte = Absent, createdAt_gt = Absent, createdAt_gte = Absent, id = Absent, id_not = Absent, id_in = Present idList, id_not_in = Absent, id_lt = Absent, id_lte = Absent, id_gt = Absent, id_gte = Absent, id_contains = Absent, id_not_contains = Absent, id_starts_with = Absent, id_not_starts_with = Absent, id_ends_with = Absent, id_not_ends_with = Absent, text = Absent, text_not = Absent, text_in = Absent, text_not_in = Absent, text_lt = Absent, text_lte = Absent, text_gt = Absent, text_gte = Absent, text_contains = Absent, text_not_contains = Absent, text_starts_with = Absent, text_not_starts_with = Absent, text_ends_with = Absent, text_not_ends_with = Absent, chat = Absent, from = Absent }
-- (\optionals -> { optionals | episode = Present Episode.Empire })
-- message : SelectionSet Message GraphCool.Object.Message
-- message =
--     Message.selection Message
--         |> with (Message.chat identity chatId)
--         |> with Message.createdAt
--         |> with (Message.from identity userId)
--         |> with Message.id
--         |> with Message.text


messageText : SelectionSet String GraphCool.Object.Message
messageText =
    Message.selection identity |> with Message.text


userName : SelectionSet String GraphCool.Object.User
userName =
    User.selection identity |> with User.name


eventName : SelectionSet String GraphCool.Object.Event
eventName =
    Event.selection identity |> with Event.name


makeQueryRequest : Cmd Msg
makeQueryRequest =
    query
        |> Graphqelm.Http.queryRequest "https://api.graph.cool/simple/v1/PlusOne"
        |> Graphqelm.Http.send (RemoteData.fromResult >> GotResponse)


type Msg
    = GotResponse (RemoteData Graphqelm.Http.Error Response)


type alias Model =
    RemoteData Graphqelm.Http.Error Response


init : ( Model, Cmd Msg )
init =
    ( RemoteData.Loading
    , makeQueryRequest
      -- change this to MakeMutationRequest if you want to test a mutation.
    )


view : Model -> Html.Html Msg
view model =
    let
        response =
            case model of
                NotAsked ->
                    text "Hold up, Lemme Check"

                Loading ->
                    text "Gimme a Sec"

                Failure e ->
                    text ("Shucks um, " ++ Basics.toString e)

                Success a ->
                    div []
                        [ div []
                            [ h5 [] [ text "Messages" ]
                            , div []
                                (List.map (\b -> div [] [ text (Basics.toString b.messages) ]) a.chats)
                            ]
                        ]
    in
    div []
        [ div []
            [ h1 [] [ text "Generated Query" ]
            , pre [] [ text (Document.serializeQuery query) ]
            ]
        , div []
            [ h1 [] [ text "Response" ]
            , h2 [] [ text "Raw" ]
            , Html.text (Basics.toString model)
            , h2 [] [ text "Refined" ]
            , response
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse response ->
            ( response, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
