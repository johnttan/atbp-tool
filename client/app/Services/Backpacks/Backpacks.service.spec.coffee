'use strict'

describe 'Service: Backpacks', ->

  # load the service's module
  beforeEach module 'vagrantApp'

  # instantiate service
  Backpacks = undefined
  beforeEach inject (_Backpacks_) ->
    Backpacks = _Backpacks_

  it 'should do something', ->
    expect(!!Backpacks).toBe true
