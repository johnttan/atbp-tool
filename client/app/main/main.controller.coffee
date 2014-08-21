'use strict'


angular.module 'vagrantApp'
.controller 'MainCtrl', ($scope, $rootScope, $state, $location, Champions, Backpacks) ->
	if $location.path() is '/'
		$state.go('main.champions')
	$scope.isActive = (route)->
		route is $location.path()
	do(scope=$scope)->
		$rootScope.$on('collapse', ->
				console.log 'collapse in main'
				scope.collapsed = true
			)
		$rootScope.$on('expand', ->
				console.log 'expand in main'
				scope.collapsed = false
			)
