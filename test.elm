module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as Decode
import Mouse exposing (Position)
import Window exposing (..)
import Task exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL
-- windowSize = window.size + tubeSize ( or greater for margin)
-- if ( windowSize < tubeOffset ) {tubeOffset - poolsize}
-- Determine offset with indexMap in arrays


type alias Model =
    { position : Position
    , move : Maybe Move
    , tube : Tube
    , windowSize : Size
    , tubers : List Tuber
    , users : List User
    }


initialModel : Model
initialModel =
    { position = initialPosition
    , move = Nothing
    , tube =
        initialTube
        -- 1440 is just placeholder until the task to get the window size runs
    , windowSize = Size 140 140
    , tubers = loremTubers
    , users = loremUsers
    }


type alias Move =
    { start : Position
    , current : Position
    }


type alias Tube =
    { diameter : Int
    , ring : Ring
    , spacing : Int
    , pop : Int
    }


initialTube : Tube
initialTube =
    { diameter = 100
    , ring = initialRing
    , spacing = 300
    , pop = 110
    }


type alias Ring =
    { width : Int
    , padding : Int
    }


initialRing : Ring
initialRing =
    { width = 2
    , padding = 3
    }


poolSize : Model -> Size
poolSize model =
    let
        spacingX =
            model.tube.spacing

        spacingY =
            ((spaceY model.tube.spacing) * 2)

        paddedWidth =
            toFloat (model.windowSize.width + model.tube.diameter)

        paddedHeight =
            toFloat (model.windowSize.height + model.tube.diameter)
    in
        Size
            ((ceiling (paddedWidth / (toFloat spacingX))) * spacingX)
            ((ceiling (paddedHeight / (toFloat spacingY))) * spacingY)


spaceY : Int -> Int
spaceY spacing =
    -- this makes sure that an offset of half spacing will create an equalateral triangle between all points
    round (((*) (sin (degrees 30)) (toFloat spacing)) / 2)


type alias Tuber =
    { uniqueID : Int
    , offset : Position
    }


type alias User =
    { uniqueID : Int
    , name : String
    , pic : String
    , online : Bool
    , chattor : Bool
    , chattee : Bool
    }



-- Position Was Imported


initialPosition : Position
initialPosition =
    { x = 0
    , y = 0
    }


type alias Size =
    { width : Int
    , height : Int
    }


determineTubers : Model -> List Tuber
determineTubers model =
    let
        poolRows =
            List.range 0 ((.width (poolSize model)) // model.tube.spacing)

        poolCols =
            List.range 0 ((.height (poolSize model)) // (spaceY model.tube.spacing))
    in
        List.indexedMap Tuber (List.concatMap (\x -> List.map (\y -> (staggerTubes x y model.tube.spacing)) (List.map ((*) (spaceY model.tube.spacing)) poolCols)) (List.map ((*) model.tube.spacing) poolRows))


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


loremTubers : List Tuber
loremTubers =
    [ Tuber 1 (Position 0 0)
    , Tuber 2 (Position 300 300)
    , Tuber 3 (Position 600 600)
    ]


loremUsers : List User
loremUsers =
    [ User 1 "doug" "https://randomuser.me/api/portraits/men/1.jpg" True True True
    , User 2 "lillith" "https://randomuser.me/api/portraits/men/2.jpg" True True True
    , User 3 "kyle" "https://randomuser.me/api/portraits/men/3.jpg" True True True
    , User 4 "borf" "https://randomuser.me/api/portraits/men/4.jpg" True True True
    ]


initialWindow : Cmd Msg
initialWindow =
    Task.perform InitialWindow Window.size


init : ( Model, Cmd Msg )
init =
    ( initialModel, initialWindow )



-- UPDATE


type Msg
    = MoveStart Position
    | MoveAt Position
    | MoveEnd Position
    | ResizePool Size
    | InitialWindow Size


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( updateHelp msg model, Cmd.none )


updateHelp : Msg -> Model -> Model
updateHelp msg ({ position, move, tube, windowSize, tubers, users } as model) =
    case msg of
        MoveStart xy ->
            Model position (Just (Move xy xy)) (tubePop tube) windowSize tubers users

        MoveAt xy ->
            Model position (Maybe.map (\{ start } -> Move start xy) move) tube windowSize tubers users

        MoveEnd _ ->
            Model (getPosition model) Nothing (tubePop tube) windowSize tubers users

        ResizePool windowSize ->
            Model position move tube windowSize (determineTubers model) users

        InitialWindow windowSize ->
            Model position move tube windowSize (determineTubers model) users


tubePop : Tube -> Tube
tubePop tube =
    Tube tube.pop tube.ring tube.spacing tube.diameter



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Window.resizes ResizePool, mouseMoveSubs model ]


mouseMoveSubs : Model -> Sub Msg
mouseMoveSubs model =
    case model.move of
        Nothing ->
            Sub.none

        Just _ ->
            Sub.batch [ Mouse.moves MoveAt, Mouse.ups MoveEnd ]



-- VIEW


(=>) =
    (,)

tachyonsCSS : String
tachyonsCSS =
  "https://cdnjs.cloudflare.com/ajax/libs/tachyons/4.8.1/tachyons.min.css"


view : Model -> Html Msg
view model =
  div[class "overflow-hidden"][
    Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href tachyonsCSS ] [],
    div
        [ onMouseDown
        , class "bg-black-90"
        , style
            [ "cursor" => "move"
            -- , "background-color" => "#333"
            , "height" => px model.windowSize.height
            , "overflow" => "hidden"
            ]
        ]
        (populateTubes model)
        ]

populateTubes : Model -> List (Html Msg)
populateTubes model =
    List.map (modelTube model) model.tubers


modelTube : Model -> Tuber -> Html Msg
modelTube model tuber =
    let
        x =
            ((%) (tuber.offset.x + (.x (getPosition model))) (.width (poolSize model))) - (model.tube.diameter // 2)

        y =
            ((%) (tuber.offset.y + (.y (getPosition model))) (.height (poolSize model))) - (model.tube.diameter // 2)
    in
        div
            [ style
                [ "padding" => "5px"
                , "box-sizing" => "border-box"
                , "border" => "2px solid green"
                , "transform" => "translate(-50%, -50%)"
                , "border-radius" => "50%"
                , "position" => "absolute"
                , "overflow" => "hidden"
                , "left" => px x
                , "top" => px y
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


tubeUser : Maybe User -> Html Msg
tubeUser user =
  case user of
    Just user ->
    div
        [ style
            [ "background" => ("url('" ++ user.pic ++ "')")
            , "height" => "100%"
            , "width" => "100%"
            , "background-size" => "cover"
            ]
        ]
        [ showUserProfile user ]
    Nothing -> div[][]



px : Int -> String
px number =
    toString number ++ "px"


getPosition : Model -> Position
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
    on "mousedown" (Decode.map MoveStart Mouse.position)


showUserProfile : User -> Html Msg
showUserProfile user =
  on "doubleClick"
  div
    [class "vh-100 w-100 flex items-center justify-center"] 
    [text user.name]
