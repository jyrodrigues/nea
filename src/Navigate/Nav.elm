module Navigate.Nav exposing (Model, Msg(..), subscriptions, update, view, viewLink)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Route exposing (Model, routeToString)
import Url
import Url.Parser as P



-- MODEL


type alias Model =
    {}



-- UPDATE


type Msg
    = NavMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( Debug.log "model inside Nav module:" model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Route.Model -> { body : List (Html Msg), title : String }
view model =
    { title = "URL Interceptor"
    , body =
        [ text "The current URL is: "
        , b [] [ text (routeToString model.route) ]
        , ul []
            [ viewLink "/home"
            , viewLink "/inc"
            , viewLink "/reviews/the-century-of-the-self"
            , viewLink "/reviews/public-opinion"
            , viewLink "/reviews/shah-of-shahs"
            ]
        ]
    }


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]
