-- http://package.elm-lang.org/packages/mpizenberg/elm-pointer-events/1.0.4/Pointer
-- http://package.elm-lang.org/packages/mpizenberg/elm-touch-events/latest


module Pages.Pool.View exposing (..)

-- import Json.Decode as Decode
-- import Mouse exposing (Position)
-- import Random exposing (..)
-- import Task exposing (..)
-- import Window exposing (..)
-- import Html.Attributes exposing (..)
-- import Pages.CreateChat.Model exposing (CreateChat)
-- import Pages.Pool.Model exposing (Pool)
-- import Pages.User.Model exposing (UserProfile)

import Assets exposing (bgImg, feather)
import Dict exposing (..)
import GraphCool.Scalar exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe.Extra exposing (..)
import Types exposing (..)


-- VIEW


view : Pool -> Model -> Html Msg
view pool model =
    let
        chats =
            model.chats

        mobileHide =
            case model.route of
                Types.GoChats (Just _) ->
                    " dn flex-l"

                _ ->
                    " flex "

        allChats =
            div [ class "flex-shrink-1 flex-grow-0 bg-black-70 overflow-auto" ] (List.map (nameBar model) (Dict.keys chats))
    in
    section [ class ("animated fadeInUp flex-column items-stretch flex-auto pa0 ma0 measure-ns shadow-2-ns" ++ mobileHide) ]
        [ Assets.banner "pool"
        , allChats
        ]



-- Ideally, this String value should be an Id value, because that's what it really is, but Dict won't allow for that.
-- Perhaps we can look into switching to all-dict, I'm not sure about the performance tho


nameBar : Model -> String -> Html Types.Msg
nameBar model chatKey =
    let
        chat =
            case Dict.get chatKey model.chats of
                Just chat ->
                    chat

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at chat"
                        initChat

        pool =
            case Dict.get (toString chat.pool) model.pools of
                Just pool ->
                    pool

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at pool"
                        initPool

        event =
            case Dict.get (toString (Maybe.withDefault (Id "") pool.event)) model.events of
                Just event ->
                    event

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at event"
                        (GraphCool initEvent)

        titleOf event =
            case event of
                SeatGeek event ->
                    event.title

                GraphCool event ->
                    event.name

        initiator =
            case Dict.get (toString chat.initiated) model.users of
                Just initiator ->
                    initiator

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at initiator"
                        initUser

        recipient =
            case Dict.get (toString chat.recipient) model.users of
                Just recipient ->
                    recipient

                Nothing ->
                    Debug.log "Chats.nameBar Fucked up at recipient"
                        initUser

        messages =
            Maybe.Extra.values <| List.map (\msgId -> Dict.get (toString msgId) model.messages) chat.messages

        -- This sorting code is kinda bad, we should fix it.
        mostRecentMessage =
            messages
                |> List.reverse
                |> List.head

        ( headMessage, headTime ) =
            case Dict.get chatKey model.messages of
                Just message ->
                    ( message.text, "Draft" )

                Nothing ->
                    case mostRecentMessage of
                        Nothing ->
                            ( "No message yet. Say something.", "" )

                        Just message ->
                            ( message.text, "online" )
    in
    div
        [ class "flex items-center z-2 fadeIn animated pa3 grow hover-bg-black-20 lh-title"
        , chat.id
            |> Just
            |> Types.GoChats
            |> Types.RouteTo
            |> onClick
        ]
        [ div
            [ {--bgImg chat.userAvi--}
              class "pa4 mh2 bg-white br-pill shadow-2 ba cover br-pill"
            ]
            []
        , div [ class "flex-auto mh2" ]
            [ div [ class "flex justify-between" ]
                [ div [ class "nowrap" ]
                    [ div [ class "f5 fw6" ] [ text initiator.name ]
                    , div [ class "f5 fw4 o-60" ]
                        [ text <| titleOf event ]
                    ]
                , div [ class "mh2 self-start f7 tr o-80 flex-shrink-0" ]
                    [ div [] [ text headTime ] ]
                ]
            , div [ class "f6 truncate pt2" ] [ text <| Maybe.withDefault "No Bio Provided" initiator.bio ]
            ]
        ]



-- ---------------------- --
-- CODE BELOW IS OLD CODE --
-- ---------------------- --
-- (=>) =
--     (,)
-- -- view : Id -> Types.Model -> Html Msg
-- -- view poolId model =
-- --     let
-- --         pool =
-- --             Maybe.withDefault initPool <| Dict.get (toString poolId) model.pools
-- --         -- case model.route of
--         --     Types.GoPool id ->
--         --         Maybe.withDefault initPool <| List.head <| List.filter (id == .id) model.pools
--         --     _ ->
--         --         initPool
--         -- response =
--         --     case pool.attendConfirm of
--         --         NotAsked ->
--         --             text "Hold up, Lemme Check"
--         --         Loading ->
--         --             text "Gimme a Sec"
--         --         Failure e ->
--         --             text ("Shucks um, " ++ Basics.toString e)
--         --         Success a ->
--         --             case a of
--         --                 Nothing ->
--         --                     div [] [ text "Success. No response" ]
--         --                 Just e ->
--         --                     case e.attendingUserName of
--         --                         Nothing ->
--         --                             h4 [] [ text "You now joined the pool, but you need to have a username." ]
--         --                         Just userName ->
--         --                             h4 []
--         --                                 [ text ("Congrats, " ++ userName ++ "! You now joined the pool.") ]
--     in
--     div []
--         [ -- response,
--           div [] [ showUser initPool initChat initUser, showUser initPool initChat initUser ] -- (List.map (showUser pool.chats (Maybe.withDefault initChat <| List.head model.chats)) (Maybe.withDefault [] pool.pool.attending))
--         ]
-- showUser : Pool -> Chat -> User -> Html Msg
-- showUser pool chat user =
--     if user.id == Id "cjed2224jh6a4019863siiw2e" then
--         text ""
--     else
--         -- let
--         --     newChat =
--         --         { chat
--         --             | poolId = Maybe.withDefault (Id "") pool.event
--         --             , initiatedId = Id "cjed2224jh6a4019863siiw2e"
--         --             , recipientId = user.id
--         --         }
--         -- in
--         div []
--             [ h3 [] [ text user.name ]
--             , p [] [ text ("nameFull: " ++ Maybe.withDefault "NA" user.nameFull) ]
--             , p [] [ text ("bio: " ++ Maybe.withDefault "NA" user.bio) ]
--             , p [] [ text ("id: " ++ Basics.toString user.id) ]
--             , p [] [ text ("birthday: " ++ Basics.toString user.birthday) ]
--             -- , button [ onClick (Types.UpdateChats (Route.Chats Nothing) newChat) ] [ text ("Start chatting with " ++ user.name) ]
--             ]
-- --     div [ class "overflow-hidden bg-black-80 flex-auto" ]
--         [ div
--             [ onMouseDown
--             , class "flex-auto overflow-hidden"
--             , style [ "cursor" => "move" ]
--             ]
--             (populateTubes pool)
--         ]
-- poolSize : PoolModel.Pool -> Size -> Size
-- poolSize model windowSize =
--     let
--         spacingX =
--             model.tube.spacing
--         spacingY =
--             spaceY model.tube.spacing * 2
--         paddedWidth =
--             toFloat (windowSize.width + model.tube.diameter)
--         paddedHeight =
--             toFloat (windowSize.height + model.tube.diameter)
--     in
--     Size
--         (ceiling (paddedWidth / toFloat spacingX) * spacingX)
--         (ceiling (paddedHeight / toFloat spacingY) * spacingY)
-- spaceY : Int -> Int
-- spaceY spacing =
--     -- this makes sure that an offset of half spacing will create an equalateral triangle between all points
--     round ((*) (sin (degrees 30)) (toFloat spacing) / 2)
-- determineTubers : PoolModel.Pool -> Size -> List PoolModel.Tuber
-- determineTubers model windowSize =
--     let
--         poolRows =
--             List.range 0
--                 (.width
--                     (poolSize model windowSize)
--                     // model.tube.spacing
--                 )
--         poolCols =
--             List.range 0
--                 (.height
--                     (poolSize model windowSize)
--                     // spaceY model.tube.spacing
--                 )
--     in
--     List.indexedMap PoolModel.Tuber
--         (List.concatMap
--             (\x ->
--                 List.map (\y -> staggerTubes x y model.tube.spacing)
--                     (List.map ((*) (spaceY model.tube.spacing)) poolCols)
--             )
--             (List.map ((*) model.tube.spacing) poolRows)
--         )
-- staggerTubes : Int -> Int -> Int -> Position
-- staggerTubes x y spacing =
--     let
--         otherRow =
--             (y // spaceY spacing) % 2
--     in
--     case otherRow of
--         1 ->
--             Position (x + (spacing // 2)) y
--         _ ->
--             Position x y
-- tubePop : PoolModel.Tube -> PoolModel.Tube
-- tubePop tube =
--     PoolModel.Tube tube.pop tube.ring tube.spacing tube.diameter
-- populateTubes : PoolModel.Pool -> List (Html Msg)
-- populateTubes model =
--     List.map (modelTube model) model.tubers
-- modelTube : PoolModel.Pool -> PoolModel.Tuber -> Html Msg
-- modelTube model tuber =
--     let
--         x =
--             (%)
--                 (tuber.offset.x
--                     + .x (getPosition model)
--                 )
--                 (.width (poolSize model model.windowSize))
--                 - (model.tube.diameter // 2)
--         y =
--             (%)
--                 (tuber.offset.y
--                     + .y (getPosition model)
--                 )
--                 (.height (poolSize model model.windowSize))
--                 - (model.tube.diameter // 2)
--     in
--     div
--         [ class "dim"
--         , style
--             [ "padding" => "5px"
--             , "box-sizing" => "border-box"
--             , "border" => "2px solid green"
--             , "transform" => ("translate(calc(-50% + " ++ px x ++ "), calc(-50% + " ++ px y ++ ")")
--             , "border-radius" => "50%"
--             , "position" => "absolute"
--             , "overflow" => "hidden"
--             , "width" => px model.tube.diameter
--             , "height" => px model.tube.diameter
--             ]
--         ]
--         [ div
--             [ style
--                 [ "height" => "100%"
--                 , "border-radius" => "50%"
--                 , "overflow" => "hidden"
--                 ]
--             ]
--             [ tubeUser (List.head model.users) ]
--         ]
-- tubeUser : Maybe PoolModel.User -> Html Msg
-- tubeUser user =
--     div
--         [ style
--             [ "background" => "url('https://randomuser.me/api/portraits/men/4.jpg')"
--             , "height" => "100%"
--             , "width" => "100%"
--             , "background-size" => "cover"
--             ]
--         ]
--         []
-- px : Int -> String
-- px number =
--     toString number ++ "px"
-- getPosition : PoolModel.Pool -> Position
-- getPosition model =
--     case model.move of
--         Nothing ->
--             model.position
--         Just { start, current } ->
--             Position
--                 (model.position.x + current.x - start.x)
--                 (model.position.y + current.y - start.y)
-- onMouseDown : Attribute Msg
-- onMouseDown =
--     on "mousedown" (Decode.map MouseStart Mouse.position)
-- MODEL
-- windowSize = window.size + tubeSize ( or greater for margin)
-- if ( windowSize < tubeOffset ) {tubeOffset - poolsize}
-- Determine offset with indexMap in arrays
