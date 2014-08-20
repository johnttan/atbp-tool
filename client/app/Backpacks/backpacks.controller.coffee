'use strict'

angular.module 'vagrantApp'
.controller 'BackpacksCtrl', ($scope, Backpacks) ->
  $scope.backpacks = Backpacks.backpacksData