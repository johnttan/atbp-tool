'use strict'

describe 'Controller: BuildCtrl', ->

  # load the controller's module
  beforeEach module 'vagrantApp'
  BuildCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BuildCtrl = $controller 'BuildCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
