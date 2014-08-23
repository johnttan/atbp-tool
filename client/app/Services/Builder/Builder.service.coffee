'use strict'

angular.module 'vagrantApp'
.service 'Builder', ['$http',
    class Builder
      constructor: (@$http)->
        @build = {}
        @junkURLs = {}
      addHero: (hero)->
      	console.log hero
      	@build.hero = hero
      addBelt: (belt)->
      	console.log belt
      	@build.belt = belt
]
