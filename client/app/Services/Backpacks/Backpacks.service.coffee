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

              junkJSON = {}
              data.Junk.forEach((junk)->
                  junkKey = Object.keys(junk)[0]
                  junkJSON[junkKey] = junk[junkKey][0].junk
                )
              beltsArray = []
              _.forEach(beltsJSON, (item)->
                  beltsArray.push(item)
                )
              Backpacks.backpacksData.Belts = beltsJSON
              Backpacks.backpacksData.BeltsArray = beltsArray
              Backpacks.backpacksData.Junk = junkJSON
          ).error((data, status)->
            console.log 'error', data, status
          )

]
