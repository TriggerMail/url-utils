_ = require 'underscore'
ParamRegExp = /:([a-zA-Z0-9_-]+)/g
page = require 'page'
queryString = require 'query-string'

Utils =
  # Create URL from url constant
  # @param {string} urlConstant Url string in format /some/path/:with/:param
  # @param {object} params Url parameters
  # @param {object} query Query string parameters (optional)
  makeUrl: (urlConstant, params, query) ->
    path = urlConstant
    paramsNames = urlConstant.match ParamRegExp
    _.each paramsNames, (name) ->
      key = name.slice 1
      if not (key of params)
        throw new Error "Not found `#{key}` parameter for #{urlConstant} url."
      path = path.replace name, encodeURIComponent params[key]
    if query
      path += '?' + queryString.stringify query
    path

  # Create and navigate to the url
  # @param {string} urlConstant Url string
  # @param {object} params url parameters
  navigate: (urlConstant, params, queryParams) ->
    page Utils.makeUrl urlConstant, params, queryParams

  # Navigate to url with state parameters
  # @option {string} url Url string
  # @option {string} urlConstant Url constant, url or urlConstant are required
  # @option {object} urlParams Url parameters for makeUrl function
  # @option {object} urlQuery Url query parameters
  # @options {object} state History state parameters
  replaceUrl: ({url, urlConstant, urlParams, urlQuery, params}) ->
    if urlConstant
      url = Utils.makeUrl urlConstant, urlParams, urlQuery
    page url, params: params

module.exports = Utils
