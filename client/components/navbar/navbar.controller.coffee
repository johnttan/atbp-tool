'use strict'

angular.module 'vagrantApp'
.controller 'NavbarCtrl', ($scope, $location, $state, Builder) ->
  $scope.change = (route)->
  	$state.go(route)

  $scope.isActive = (route) ->
    route is $location.path()

  $scope.selectedHero = ->
  	if Builder.build.hero
  		return Builder.build.hero.playerData.playerDisplayName
  $scope.selectedBackpack = ->
  	if Builder.build.belt
  		return ' with ' + Builder.build.belt.name