'use strict'

angular.module 'vagrantApp'
.service 'Backpacks', ['$http',
    class Backpacks
      constructor: (@$http)->
        @backpacksData = {}
        do(Backpacks = @)->
          Backpacks.$http.get('/api/backpacks').success((data)->
              Backpacks.backpacksData.Belts = data.Belts
              Backpacks.backpacksData.Junk = data.Junk
          ).error((data, status)->
            console.log 'error', data, status
          )

]
