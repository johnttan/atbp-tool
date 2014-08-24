'use strict'

angular.module 'vagrantApp'
.service 'Builder', ['$http',
    class Builder
      constructor: (@$http)->
        @build = {}
        @junkURLs = {}
      addHero: (hero, remove)->
      	if remove
      		@build.hero = undefined
      	else
      		@build.hero = hero
      addBelt: (belt)->
      	@build.belt = belt
]
