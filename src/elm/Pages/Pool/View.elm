-- http://package.elm-lang.org/packages/mpizenberg/elm-pointer-events/1.0.4/Pointer
-- http://package.elm-lang.org/packages/mpizenberg/elm-touch-events/latest


module Pages.Pool.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as Decode
import Mouse exposing (Position)
import Pages.Pool.Model as PoolModel
import Pages.User.Model exposing (UserProfile)
import Random exposing (..)
import Task exposing (..)
import Types exposing (..)
import Window exposing (..)
import GraphCool.Scalar exposing (..)
import RemoteData exposing (..)


-- VIEW


(=>) =
    (,)


view : PoolModel.PoolModel -> Html Msg
view poolModel =
    let
        response =
            case poolModel.attendConfirm of
                NotAsked ->
                    text "Hold up, Lemme Check"

                Loading ->
                    text "Gimme a Sec"

                Failure e ->
                    text ("Shucks um, " ++ Basics.toString e)

                Success a ->
                    case a of
                        Nothing ->
                            div [] [ text "Success. No response" ]

                        Just e ->
                            case e.attendingUserName of
                                Nothing ->
                                    h4 [] [text "You now joined the pool, but you need to have a username."]
                                Just userName ->
                                    h4 [] 
                                       [ text ("Congrats, " ++ userName ++ "! You now joined the pool.") ]
                                
    in
    div [] 
        [ response    
        , div [] (List.map showUser (Maybe.withDefault [] poolModel.pool.attending))
        ]

showUser : UserProfile -> Html Msg
showUser profile =
    if profile.id == (Id "cjed2224jh6a4019863siiw2e") then
        text ""
    else
        div []
            [ h3 [][text profile.name]
            , p [] [text ("nameFull: " ++ (Maybe.withDefault "NA" profile.nameFull))]
            , p [] [text ("bio: " ++ (Maybe.withDefault "NA" profile.bio))]
            , p [] [text ("id: " ++ Basics.toString profile.id)]
            , p [] [text ("birthday: " ++ (Basics.toString profile.birthday))]
            , button [] [ text ("Start chatting with "++ profile.name)]
            ]
--     div [ class "overflow-hidden bg-black-80 flex-auto" ]
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
