'use strict'

angular.module 'vagrantApp'
.controller 'BuildCtrl', ($scope, Builder) ->
  $scope.slots = ['slot1', 'slot2', 'slot3', 'slot4', 'slot5']
  $scope.junkMods = {}
  $scope.heroLvlStats = {}
  $scope.junkLvls = {}
  $scope.skillLvl = (stat, value, skill)->
    value = parseFloat(value)
    ratio = parseFloat(skill.damageRatio)
    if stat is 'damage' and ratio < 1
      value += ratio * $scope.heroLvlStats.spellDamage
      value = parseInt(value)
    if stat is 'spellCoolDown'
      value -= value * $scope.heroLvlStats.coolDownReduction/100
    return value
  $scope.selectJunk = (num, slot)->
    if num >= 0
      $scope.junkMods = {}
      $scope.junkLvls[slot] = num
      for slot in $scope.slots
        mods = $scope.build.belt.junk[slot].mods.mod
        for mod in mods
          if parseInt(mod.point) is parseInt($scope.junkLvls[slot])
            if $scope.junkMods[mod.stat]
              $scope.junkMods[mod.stat] += parseInt(mod.value)
            else
              $scope.junkMods[mod.stat] = parseInt(mod.value)

  $scope.maxJunkLvl = [4, 3, 2, 1]
  $scope.build = Builder.build
  $scope.lvl = 1
  $scope.lvlUp = ->
    $scope.lvl += 1
  $scope.lvlDown = ->
    $scope.lvl -= 1
  $scope.mods = ['modDescription1', 'modDescription2', 'modDescription3']
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
        statValue = parseInt(value) - lvl*actorStats[perLevelStat]
      else
        statValue = parseInt(value) + lvl*actorStats[perLevelStat]
    else
      statValue = value
    if $scope.junkMods[stat]
      statValue += parseInt($scope.junkMods[stat])
    $scope.heroLvlStats[stat] = statValue
    return statValue.toString()
  $scope.avatarUrl = ->
    urlname = $scope.build.hero.name
    if urlname is 'flame'
      urlname = 'flameprincess'
    else if urlname is 'princessbubblegum'
      urlname = 'pb'
    url = "http://i.cdn.turner.com/toon/games/adventuretime/adventure-time-battle-party/assets/img/champions-icon-" + urlname + ".jpg"
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
    attackDamage: 'Attack'
    attackSpeed: 'AS'
    attackRange: 'Range'
    criticalChance: 'Crit %'
    armorPenetration: 'Armor Breach'
    armor: 'Armor'
    health: 'HP'
    healthRegen: 'HP Regen'
    spellResist: 'Shields'
    spellDamage: 'Power'
    coolDownReduction: 'CDR'
    speed: 'Movespeed'
    spellPenetration: 'Shield Breach'
  }

  $scope.statsKeysExcludes = {
    lifeSteal: true
    pLevel: true
    valueScore: true
    visionDistance: true
    spellVamp: true
    weaponType: true
  }

