module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, span, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import Theme exposing (Theme)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = \model -> { title = "theteachr", body = [ view model ] }
        , subscriptions = \_ -> Sub.none
        }


type Msg
    = SwitchTheme


type alias Model =
    { theme : Theme
    }


init : flags -> ( Model, Cmd Msg )
init _ =
    ( { theme = Theme.Dark }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SwitchTheme ->
            ( { model | theme = Theme.next model.theme }, Cmd.none )


view : Model -> Html Msg
view model =
    div [ id "main", class <| Theme.toString model.theme ]
        [ div
            [ class "center" ]
            [ h1
                [ id "faq" ]
                [ text "I use "
                , span
                    [ class "gradient" ]
                    [ text "Keynote" ]
                , span
                    [ class "punctuation"
                    , onClick SwitchTheme
                    ]
                    [ text "." ]
                ]
            ]
        ]
