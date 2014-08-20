'use strict'

describe 'Service: Champions', ->

  # load the service's module
  beforeEach module 'vagrantApp'

  # instantiate service
  Champions = undefined
  beforeEach inject (_Champions_) ->
    Champions = _Champions_

  it 'should do something', ->
    expect(!!Champions).toBe true
