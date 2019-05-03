module Route exposing (Model, Route(..), parseUrl, routeParser, routeToString)

import Browser.Navigation as Nav
import Url
import Url.Parser as P



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , route : Route
    }



-- Route (Url Parser)


type Route
    = AnyString String
    | Home
    | NotFound Url.Url


parseUrl : Url.Url -> Route
parseUrl url =
    Maybe.withDefault (NotFound url) (P.parse routeParser url)


routeParser : P.Parser (Route -> a) a
routeParser =
    P.oneOf
        [ P.map Home P.top
        , P.map AnyString P.string
        ]


routeToString : Route -> String
routeToString route =
    case route of
        AnyString s ->
            "Got this weird string: " ++ s

        Home ->
            "Just plain ol' home ya know?"

        NotFound url ->
            "404! I don't know this route: " ++ Url.toString url
