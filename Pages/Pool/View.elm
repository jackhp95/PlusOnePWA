-- http://package.elm-lang.org/packages/mpizenberg/elm-pointer-events/1.0.4/Pointer
-- http://package.elm-lang.org/packages/mpizenberg/elm-touch-events/latest


module Pages.Pool.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as Decode
import Mouse exposing (Position)
import Window exposing (..)
import Task exposing (..)
import Random exposing (..)
import Types exposing (..)

import Pages.Pool.Model as PoolModel


-- VIEW


(=>) =
    (,)


view : PoolModel.Pool -> Html Msg
view pool =
    div [ class "overflow-hidden bg-black-80 flex-auto" ]
        [ div
            [ onMouseDown
            , class "flex-auto overflow-hidden"
            , style [ "cursor" => "move" ]
            ]
            (populateTubes pool)
        ]


poolSize : PoolModel.Pool -> Size -> Size
poolSize model windowSize =
    let
        spacingX =
            model.tube.spacing

        spacingY =
            ((spaceY model.tube.spacing) * 2)

        paddedWidth =
            toFloat (windowSize.width + model.tube.diameter)

        paddedHeight =
            toFloat (windowSize.height + model.tube.diameter)
    in
        Size
            ((ceiling (paddedWidth / (toFloat spacingX))) * spacingX)
            ((ceiling (paddedHeight / (toFloat spacingY))) * spacingY)


spaceY : Int -> Int
spaceY spacing =
    -- this makes sure that an offset of half spacing will create an equalateral triangle between all points
    round (((*) (sin (degrees 30)) (toFloat spacing)) / 2)


determineTubers : PoolModel.Pool -> Size -> List PoolModel.Tuber
determineTubers model windowSize =
    let
        poolRows =
            List.range 0
                ((.width
                    (poolSize model windowSize)
                 )
                    // model.tube.spacing
                )

        poolCols =
            List.range 0
                ((.height
                    (poolSize model windowSize)
                 )
                    // (spaceY model.tube.spacing)
                )
    in
        List.indexedMap PoolModel.Tuber
            (List.concatMap
                (\x ->
                    List.map (\y -> (staggerTubes x y model.tube.spacing))
                        (List.map ((*) (spaceY model.tube.spacing)) poolCols)
                )
                (List.map ((*) model.tube.spacing) poolRows)
            )


staggerTubes : Int -> Int -> Int -> Position
staggerTubes x y spacing =
    let
        otherRow =
            ((y // (spaceY spacing)) % 2)
    in
        case (otherRow) of
            1 ->
                Position (x + (spacing // 2)) y

            _ ->
                Position x y


tubePop : PoolModel.Tube -> PoolModel.Tube
tubePop tube =
    PoolModel.Tube tube.pop tube.ring tube.spacing tube.diameter


populateTubes : PoolModel.Pool -> List (Html Msg)
populateTubes model =
    List.map (modelTube model) model.tubers


modelTube : PoolModel.Pool -> PoolModel.Tuber -> Html Msg
modelTube model tuber =
    let
        x =
            ((%)
                (tuber.offset.x
                    + (.x (getPosition model))
                )
                (.width (poolSize model model.windowSize))
            )
                - (model.tube.diameter // 2)

        y =
            ((%)
                (tuber.offset.y
                    + (.y (getPosition model))
                )
                (.height (poolSize model model.windowSize))
            )
                - (model.tube.diameter // 2)
    in
        div
            [ class "dim"
            , style
                [ "padding" => "5px"
                , "box-sizing" => "border-box"
                , "border" => "2px solid green"
                , "transform" => ("translate(calc(-50% + " ++ px x ++ "), calc(-50% + " ++ px y ++ ")")
                , "border-radius" => "50%"
                , "position" => "absolute"
                , "overflow" => "hidden"
                , "width" => px model.tube.diameter
                , "height" => px model.tube.diameter
                ]
            ]
            [ div
                [ style
                    [ "height" => "100%"
                    , "border-radius" => "50%"
                    , "overflow" => "hidden"
                    ]
                ]
                [ tubeUser (List.head model.users) ]
            ]


tubeUser : Maybe PoolModel.User -> Html Msg
tubeUser user =
    div
        [ style
            [ "background" => ("url('https://randomuser.me/api/portraits/men/4.jpg')")
            , "height" => "100%"
            , "width" => "100%"
            , "background-size" => "cover"
            ]
        ]
        []


px : Int -> String
px number =
    toString number ++ "px"


getPosition : PoolModel.Pool -> Position
getPosition model =
    case model.move of
        Nothing ->
            model.position

        Just { start, current } ->
            Position
                (model.position.x + current.x - start.x)
                (model.position.y + current.y - start.y)


onMouseDown : Attribute Msg
onMouseDown =
    on "mousedown" (Decode.map MouseStart Mouse.position)



-- MODEL
-- windowSize = window.size + tubeSize ( or greater for margin)
-- if ( windowSize < tubeOffset ) {tubeOffset - poolsize}
-- Determine offset with indexMap in arrays
