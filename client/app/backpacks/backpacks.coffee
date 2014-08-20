'use strict'

angular.module 'vagrantApp'
.config ($stateProvider) ->
	# This is child state of champions so that champions view isn't rerendered.
  $stateProvider.state 'main.champions.backpacks',
  # ^ means use absolute URL instead of nesting under /champions
    url: '^/backpacks'
    templateUrl: 'app/backpacks/backpacks.html'
    controller: 'BackpacksCtrl'
