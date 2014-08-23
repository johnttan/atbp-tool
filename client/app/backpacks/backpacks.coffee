'use strict'

angular.module 'vagrantApp'
.config ($stateProvider) ->
  $stateProvider.state 'main.backpacks',
    url: 'backpacks'
