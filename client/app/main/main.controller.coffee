'use strict'


angular.module 'vagrantApp'
.controller 'MainCtrl', ($scope, $location, Champions, Backpacks) ->

  $scope.isActive = (route)->
  	route is $location.path()
