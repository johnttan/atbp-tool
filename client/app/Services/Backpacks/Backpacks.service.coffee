'use strict'

angular.module 'vagrantApp'
.service 'Backpacks', ['$http',
    class Backpacks
      constructor: (@$http)->
        @backpacksData = {}
        do(Backpacks = @)->
          Backpacks.$http.get('/api/backpacks').success((data)->
              beltsJSON = {}
              data.Belts.forEach((belt)->
                  beltKey = Object.keys(belt)[0]
                  beltsJSON[beltKey] = belt[beltKey][0].belt
                )
              Backpacks.backpacksData.Belts = beltsJSON
              Backpacks.backpacksData.Junk = data.Junk
          ).error((data, status)->
            console.log 'error', data, status
          )

]
