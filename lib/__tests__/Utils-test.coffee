jest.autoMockOff()

Utils = require '../Utils.coffee'

describe 'Utils', ->
  it 'should fill url constant with parameters', ->
    urlParams =
      param1: 'foo'
      param2: 'bar'
    expect Utils.makeUrl '/:param1/:param2', urlParams
      .toBe '/foo/bar'

  it 'should return empty string on empty url constant', ->
    expect Utils.makeUrl ''
      .toBe ''

  it 'should do nothing with empty list of parameters', ->
    url = 'myurl'
    expect Utils.makeUrl url
      .toBe url

  it 'should add query parameters', ->
    url = 'myurl'
    expect Utils.makeUrl url, {}, param1: 'value'
      .toBe 'myurl?param1=value'
