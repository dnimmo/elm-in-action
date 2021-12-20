module Main exposing (..)

import Element exposing (..)
import Element.Border as Border
import Html exposing (Html)


type alias Model =
    { photos : List { url : String }
    , selected : String
    }


initialPhoto : String
initialPhoto =
    "1.jpeg"


initialModel : Model
initialModel =
    { photos =
        [ { url = initialPhoto }
        , { url = "2.jpeg" }
        , { url = "3.jpeg" }
        ]
    , selected = initialPhoto
    }


urlPrefix : String
urlPrefix =
    "http://elm-in-action.com/"


viewThumbnail : Bool -> String -> Element msg
viewThumbnail isSelected str =
    image
        [ Border.width <|
            if isSelected then
                2

            else
                1
        ]
        { src = urlPrefix ++ str
        , description = ""
        }


view : Model -> Html msg
view model =
    layout [] <|
        column
            []
            [ el [] <| text "Photo Groove"
            , row []
                [ row []
                    (model.photos
                        |> List.map .url
                        |> List.map (\x -> viewThumbnail (x == model.selected) x)
                    )
                , image []
                    { src = urlPrefix ++ "large/" ++ model.selected
                    , description = ""
                    }
                ]
            ]


main : Html msg
main =
    view initialModel
