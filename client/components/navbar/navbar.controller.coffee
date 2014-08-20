'use strict'

angular.module 'vagrantApp'
.controller 'NavbarCtrl', ($scope, $location, $state) ->
  $scope.change = (route)->
  	$state.go(route)

  $scope.isActive = (route) ->
    route is $location.path()