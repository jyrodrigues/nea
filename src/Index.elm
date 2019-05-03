{--

This file only exists to prove that elm-webpack-loader loads
every .elm file regardless of which one we import inside index.js

All top level files are compiled, so you can call any ElmFile.elm
as Elm.ElmFile.init() inside index.js

--}


module EmptyIndex exposing (empty)


empty =
    ""
