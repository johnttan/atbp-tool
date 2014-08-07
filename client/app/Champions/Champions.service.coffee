'use strict'

angular.module 'vagrantApp'
.service 'Champions', ['$http',
    class Champions
      constructor: (@$http)->
        @championsData = []
        do(Champions = @)->
          Champions.$http.get('/api/champions').success((data)->
            console.log 'success got data'
            console.log typeof data
            data.forEach((el)->
              champO = {}
              champO.name = Object.keys(el)[0]
              _.forIn(el[champO.name][0]['ActorData'], (value, key)->
                champO[key] = value
              )

              Champions.championsData.push(champO)
            )
          ).error((data, status)->
            console.log 'error', data, status
          )

]