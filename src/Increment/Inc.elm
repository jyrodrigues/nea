module Increment.Inc exposing (MyModel, MyMsg(..), init, update, view)

import Browser
import Html exposing (Html, a, button, div, text)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
import Route



-- MODEL


type alias MyModel =
    Int


init : MyModel
init =
    0



-- UPDATE


type MyMsg
    = Increment
    | Decrement
    | Reset


update : MyMsg -> Route.Model -> Route.Model
update msg model =
    model



-- case msg of
--     Increment ->
--         model + 1
--     Decrement ->
--         model - 1
--     Reset ->
--         init
-- VIEW


view : Route.Model -> { body : List (Html MyMsg), title : String }
view model =
    { title = "Increment"
    , body =
        [ div []
            [ a [ href "/" ] [ text "Go back to nav" ]
            , button [ onClick Decrement ] [ text "-" ]

            -- , div [] [ text (String.fromInt model) ]
            , div [] [ text "Make me work!" ]
            , button [ onClick Increment ] [ text "+" ]
            , button [ onClick Reset ] [ text "reset" ]
            ]
        ]
    }
