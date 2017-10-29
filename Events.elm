-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { hello : String
  , world : String
  }


init : ( Model, Cmd msg )
init = (
  { hello ="hello" 
  , world = "world"
  }, Cmd.none)



-- UPDATE


type Msg
  = Howdy
  | Pardner


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
  case msg of
    Howdy -> 
        ( { model | hello = "howdy" } , Cmd.none )
    
    Pardner -> 
        ( { model | world = "pardner" } , Cmd.none )


-- VIEW
tachyonsCSS : String
tachyonsCSS =
  "Admin/tachyons.css"

plusOneCSS : String
plusOneCSS =
  "Admin/plusOne.css"

view : Model -> Html Msg
view model =
    div [ class "overflow-hidden bg-black"][
        Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href tachyonsCSS ][],
        Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href plusOneCSS ][],
        div [ class "white sans-serif flex fw1 vh-100" ]
    [ navBar
    , main_ [ class "vh-100 w-100 bg-tone-80 pl4-l ml6-l mt5-m pt3-m flex" ]
        [ section [ class "bg-black-10 flex-auto overflow-auto z-999 shadow-2" ]
            [ div [ class "lg-magenta-purple-80 h5 flex flex-column justify-between pa4" ]
                [ input [ class "fw2 pa2 bg-transparent b--none outline-0 white focus-underline f4 f5-m self-stretch placeholder-white-50", placeholder "search", type_ "search" ]
                    []
                , h1 [ class "tr f1 f2-m white lh-solid fw9 ma0 pa0" ]
                    [ text "discover events" ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-purple-red-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-blue-teal-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-purple-teal-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-blue-magenta-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-mint-teal-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-blue-teal-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-magenta-red-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-blue-teal-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-blue-green-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-yellow-teal-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-red-blue-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            , div [ class "flex flex-column flex-row-l items-center-l justify-start pa3 bb-l b--white-05" ]
                [ div [ class "w-100 w-auto-l pa4-l br-pill-l lg-yellow-magenta-80" ]
                    [ div [ class "aspect-ratio--8x5 dn-l" ]
                        []
                    ]
                , div [ class "flex-l flex-column-l ph3-l" ]
                    [ h3 [ class "dib mw6-l light-silver mt3 mb2 ma0-l pv2-l f3" ]
                        [ text "chance the rapper "
                        , span [ class "fw5 silver" ]
                            [ text "@ the blue note" ]
                        ]
                    , div [ class "dib-l ma0-l mb2 pb1-l pb4 bb bn-l b--white-20" ]
                        [ h4 [ class "dib fw2 silver ma0" ]
                            [ text "tomorrow night" ]
                        ]
                    ]
                ]
            ]
        , section [ class "bg-black-20 flex-auto dn db-ns vh-100" ]
            [ div [ class "lg-mint-red-30 h5 flex flex-column justify-between pa4" ]
                [ ul [ class "list white ma0 pa0 flex justify-end w-100 f7 pv2" ]
                    [ li [ class "grow-large dn dib-l pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-teal-50" ]
                        [ text "share" ]
                    , li [ class "grow-large dn dib-l pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-red-50" ]
                        [ text "like" ]
                    , li [ class "grow-large pv1 ph3 ml3 ba b--white-50 br-pill hover-bg-mint-50" ]
                        [ text "more" ]
                    ]
                , h1 [ class "tr f1 f2-m white lh-solid fw9 ma0 pa0" ]
                    [ text "chance the rapper" ]
                ]
            , ul [ class "w-100 h4 list ma0 pa0 flex gray justify-around items-center" ]
                [ li []
                    [ text "popularity" ]
                , li []
                    [ text "distance" ]
                , li []
                    [ text "type" ]
                , li []
                    [ text "food" ]
                ]
            , div [ class "flex fixed flex-auto self-end" ]
                [ h3 [ class "pa3 flex-auto tc f3 bg-blue-50 fw9" ]
                    [ text "buy tickets" ]
                , h3 [ class "pa3 flex-auto tc f3 bg-magenta-50 fw9" ]
                    [ text "view pool" ]
                ]
            ]
        ]
    ]
    
    ]

navBar : Html Msg
navBar =
    nav [ class "bg-near-black z-9999 w-100 w4-l pt2-l pr4-l vh-100-l flex justify-between justify-start-l fixed self-start-ns flex-column-l self-end shadow-2" ]
        [ navHome
        , ul [ class "list ma0 pa0 flex justify-around items-center-m w-100 w-auto-l flex-column-l f6 f5-ns light-silver" ]
        ( List.map navTab ["discover", "add", "stats", "chats", "profile"] )
        ]

navHome : Html Msg
navHome =
    span [ class "fw7 pa4 mh2-m dn dib-ns f3-l f4-m" ][ text "PlusOne" ]

navTab : String -> Html Msg
navTab page =
    li [ class "flex-auto tc pv4 pv3-l pl4-l pr6-l ph2 hover-bg-teal-50" ][ text page ]

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- HTTP

