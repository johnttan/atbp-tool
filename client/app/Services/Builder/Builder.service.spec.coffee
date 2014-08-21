'use strict'

describe 'Service: Builder', ->

  # load the service's module
  beforeEach module 'vagrantApp'

  # instantiate service
  Builder = undefined
  beforeEach inject (_Builder_) ->
    Builder = _Builder_

  it 'should do something', ->
    expect(!!Builder).toBe true
