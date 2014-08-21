'use strict'

angular.module 'vagrantApp'
.controller 'BackpacksCtrl', ($scope, Backpacks) ->
	$scope.search = {}
	$scope.backpacks = Backpacks.backpacksData
	$scope.slots = ['slot1', 'slot2', 'slot3', 'slot4']
	$scope.mods = ['modDescription1', 'modDescription2', 'modDescription3']
	$scope.junkIcon = (junk)->
		url = "http://i.cdn.turner.com/toon/games/adventuretime/adventure-time-battle-party/assets/img/icons/backpacks/" + junk + ".png"
		return url
		
	$scope.searchName = (belt)->
		if $scope.search.Backpack
			LCbelt = belt.name.toLowerCase()
			LCsearch = $scope.search.Backpack.toLowerCase()
			decision = LCbelt.indexOf(LCsearch) > -1
		else
			decision = true
		return decision 