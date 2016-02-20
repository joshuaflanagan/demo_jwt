var path = require('path');

module.exports = {
  context: __dirname + "/js_app",

  entry:{
    app: [
      'webpack-dev-server/client?http://localhost:3001',
      './src/app.jsx',
    ]
  },

  output: {
    path: __dirname + "/js_app/host",
    filename: "react_app.js"
  },
  module: {
    loaders: [
      {
        test: /\.js|\.jsx/,
        include: path.join(__dirname, 'js_app/src'),
        loaders: ['babel'],
      }
    ]
  },
  devServer: {
    contentBase: path.join(__dirname, 'js_app/host'),
    publicPath: "/",
    historyApiFallback: true,
    port: 3001
  }
};
