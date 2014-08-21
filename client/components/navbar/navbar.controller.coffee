'use strict'

angular.module 'vagrantApp'
.controller 'NavbarCtrl', ($scope, $rootScope, $location, $state, Builder) ->
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

  $scope.collapsed = false

  $scope.collapse = (build)->
    console.log 'collapsing'
    # This logic collapses the menu when navigating to build tab.
    # If menu was collapsed due to build, menu is expanded upon navigation to Heroes or Backpacks tab.
    if build is 'build'
      $scope.collapsed = true
      $scope.buildCollapsed = true
    else
      if $scope.buildCollapsed
        $scope.collapsed = false
        $scope.buildCollapsed = false
      else
        if build is 'toggle'
          $scope.collapsed = !$scope.collapsed
    if $scope.collapsed
      $rootScope.$emit('collapse')
    else
      $rootScope.$emit('expand')