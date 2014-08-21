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

  it 'should return icon url', ->
    expect(scope.junkIcon('finn')).toEqual "http://i.cdn.turner.com/toon/games/adventuretime/adventure-time-battle-party/assets/img/icons/backpacks/finn.png"
