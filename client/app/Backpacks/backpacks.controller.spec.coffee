'use strict'

describe 'Controller: BackpacksCtrl', ->

  # load the controller's module
  beforeEach module 'vagrantApp'
  BackpacksCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BackpacksCtrl = $controller 'BackpacksCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
