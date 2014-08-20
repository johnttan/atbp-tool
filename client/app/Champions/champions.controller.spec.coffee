'use strict'

describe 'Controller: ChampionsCtrl', ->

  # load the controller's module
  beforeEach module 'vagrantApp'
  ChampionsCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ChampionsCtrl = $controller 'ChampionsCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
