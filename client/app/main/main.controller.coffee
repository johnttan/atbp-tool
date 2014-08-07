'use strict'


angular.module 'vagrantApp'
.controller 'MainCtrl', ($scope, $http, socket, Champions) ->
  $scope.champs = Champions.championsData
  $scope.grid = true
  $scope.searchQuery = {}
  $scope.sortKey = undefined
  $scope.reverseSort = false
  $scope.order = 'Ascending'

  $scope.reverse = ->
    $scope.reverseSort = !$scope.reverseSort
    $scope.order = if $scope.reverseSort then 'Descending' else 'Ascending'
  $scope.getSortValue = (champ)->
    if $scope.sortKey
      return parseFloat(champ.actorStats[$scope.sortKey])
    else
      return champ.playerData.playerDisplayName
  $scope.search = (champion)->
    if $scope.searchQuery.name
        return champion.playerData.playerDisplayName.indexOf($scope.searchQuery.name) > -1 or champion.playerData.playerDisplayName.indexOf($scope.searchQuery.name2) > -1
    else
      return true
  $scope.spellKeys = ["spellType", 'spellRange', 'castDelay', 'spellCoolDown', 'damage', 'damageRatio', 'spellArea', 'spellDuration']
  $scope.statsKeysExcludes = ["lifeSteal", "pLevel", "valueScore", "visionDistance", "spellVamp", "weaponType", "coolDownReduction"]
  $scope.statsKeys = ->
    stats = []
    for stat in Object.keys($scope.champs[0].actorStats)
      if stat not in $scope.statsKeysExcludes
        stats.push(stat)
    return stats
  $scope.refresh = ->
    $scope.$digest()
  console.log typeof $scope.champs