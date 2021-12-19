module Main exposing (..)

import Element exposing (..)
import Html exposing (Html)


view : String -> Html msg
view model =
    layout [] <|
        column
            []
            [ el [] <| text "Photo Groove"
            , row []
                [ image []
                    { src = "http://elm-in-action.com/1.jpeg"
                    , description = ""
                    }
                , image []
                    { src = "http://elm-in-action.com/2.jpeg"
                    , description = ""
                    }
                , image []
                    { src = "http://elm-in-action.com/3.jpeg"
                    , description = ""
                    }
                ]
            ]


main : Html msg
main =
    view "no model yet"
