path = require 'path'

module.exports =

  entry:
    index: './index.coffee'

  output:
    path: path.resolve './dist'
    filename: 'index.js'
    libraryTarget: 'commonjs2'

  externals:
    'react': 'react'
    'underscore': 'underscore'
    'query-string': 'query-string'
    'page': 'page'

  module:
    loaders: [
      test: /\.coffee/
      loader: 'coffee'
    ]
