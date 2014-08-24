'use strict'

angular.module 'vagrantApp'
.service 'Builder', ['$http',
    class Builder
      constructor: (@$http)->
        @build = {}
        @junkURLs = {}
      addHero: (hero)->
      	@build.hero = hero
      addBelt: (belt)->
      	@build.belt = belt
]
