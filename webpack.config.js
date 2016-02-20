var path = require('path');
process.env.NODE_ENV = "production";

module.exports = {
  context: __dirname + "/js_app",

  entry:{
    app: [
      './src/app.jsx'
    ]
  },

  output: {
    path: path.join(__dirname, "public/javascripts"),
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
  }
};
