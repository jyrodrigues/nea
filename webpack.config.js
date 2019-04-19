const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, 'dist')
  },
  devServer: {
    contentBase: path.resolve(__dirname, 'dist'),
    // compress: true,
    port: 9000
  },
  module: {
    rules: [
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: "file-loader?name=[name].[ext]",
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: {
          loader: "elm-webpack-loader?verbose=true",
          options: {
            optimize: false,
            debug: false,
            files: [
              path.resolve(__dirname, "src/Main.elm"),
              path.resolve(__dirname, "src/Nav.elm")
            ]
          }
        }
      }
    ]
  }
};