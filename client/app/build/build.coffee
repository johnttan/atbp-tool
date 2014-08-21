'use strict'

angular.module 'vagrantApp'
.config ($stateProvider) ->
  $stateProvider.state 'main.build',
    url: 'build'
    templateUrl: 'app/build/build.html'
    controller: 'BuildCtrl'
