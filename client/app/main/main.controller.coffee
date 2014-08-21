'use strict'


angular.module 'vagrantApp'
.controller 'MainCtrl', ($scope, $state, $location, Champions, Backpacks) ->
	if $location.path() is '/'
		$state.go('main.champions')
	$scope.isActive = (route)->
		route is $location.path()
