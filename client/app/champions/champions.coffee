'use strict'

angular.module 'vagrantApp'
.config ($stateProvider) ->
  $stateProvider.state 'main.champions',
    url: 'champions'
    # templateUrl: 'app/champions/champions.html'
    # controller: 'ChampionsCtrl'
