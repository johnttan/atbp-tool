'use strict'

angular.module 'vagrantApp'
.config ($stateProvider) ->
  $stateProvider.state 'main.build',
    url: 'build'
