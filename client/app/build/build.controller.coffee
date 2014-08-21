'use strict'

angular.module 'vagrantApp'
.controller 'BuildCtrl', ($scope, Builder) ->
  $scope.build = Builder.build
  $scope.lvl = 1
  $scope.perLevel1 = (stat)->
    actorStats = $scope.build.hero.actorStats
    perLevelStat = stat + 'PerLevel'
    if actorStats[perLevelStat]
      return ' (+' + actorStats[perLevelStat] + ')'
  $scope.perLevelV1 = (stat)->
    actorStats = $scope.build.hero.actorStats
    value = actorStats[stat]
    perLevelStat = stat + 'PerLevel'
    if actorStats[perLevelStat]
      if $scope.lvl > 0
        lvl = $scope.lvl - 1
      else
        lvl = 0

      if stat is 'attackSpeed'
        return (parseInt(value) - lvl*actorStats[perLevelStat]).toString()
      else
        return (parseInt(value) + lvl*actorStats[perLevelStat]).toString()
    else
      return value
  $scope.avatarUrl = ->
    urlname = $scope.build.hero.name
    if urlname is 'flame'
      urlname = 'flameprincess'
    else if urlname is 'princessbubblegum'
      urlname = 'pb'
    url = "http://i.cdn.turner.com/toon/games/adventuretime/adventure-time-battle-party/assets/img/champions-icon-" + urlname + ".jpg"
    console.log url
    return url
  $scope.spellKeys = {
    spellRange: 'Range'
    castDelay: 'Delay'
    spellCoolDown: 'CD'
    damage: 'Damage'
    damageRatio: 'Scaling'
    spellArea: 'AOE'
    spellDuration: 'Duration'
  }
  $scope.convertTable = {
    attackDamage: 'AD'
    attackSpeed: 'AS'
    attackRange: 'Range'
    criticalChance: 'Crit %'
    armorPenetration: 'Armor Pen'
    armor: 'Armor'
    health: 'HP'
    healthRegen: 'HP Regen'
    spellResist: 'MR'
    spellDamage: 'AP'
    coolDownReduction: 'CDR'
    speed: 'Movespeed'
    spellPenetration: 'Magic Pen'
  }

  $scope.statsKeysExcludes = {
    lifeSteal: true
    pLevel: true
    valueScore: true
    visionDistance: true
    spellVamp: true
    weaponType: true
  }

