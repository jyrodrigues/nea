module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Navigate.Nav as Navigate
import Route exposing (Model, parseUrl)
import Url
import Url.Parser as P



-- import Url.Parse
-- MAIN


main : Program () Route.Model Msg
main =
    Browser.application
        { init = init
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


init : () -> Url.Url -> Nav.Key -> ( Route.Model, Cmd Msg )
init flags url key =
    ( Model key url (parseUrl url), Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | NavigateMsg Navigate.Msg


update : Msg -> Route.Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url, route = parseUrl url }
            , Cmd.none
            )

        NavigateMsg _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Route.Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Route.Model -> Browser.Document Msg
view model =
    let
        viewPage toMsg doc =
            let
                { title, body } =
                    doc
            in
            { title = title, body = List.map (Html.map toMsg) body }
    in
    case model.route of
        _ ->
            viewPage NavigateMsg (Navigate.view model)



-- URL PARSER
