'use strict'


angular.module 'vagrantApp'
.controller 'ChampionsCtrl', ($scope, Champions, Backpacks, Builder) ->

  $scope.lvl = 1
  $scope.showHeroSelect = true
  $scope.sortButton = 'Reverse Order'
  $scope.champs = Champions.championsData
  $scope.grid = true
  $scope.searchQuery = {
    name: ''
    name2: ''
  }
  $scope.sortKey = undefined
  $scope.reverseSort = false
  $scope.order = 'Ascending'
  $scope.setTableSort = (stat)->
    if $scope.sortKey is stat
      $scope.reverseSort = !$scope.reverseSort
      $scope.order = if $scope.reverseSort then 'Descending' else 'Ascending'
    $scope.sortKey = stat
  
  $scope.setTableClass = (stat)->
    if $scope.sortKey is stat
      if $scope.reverseSort
        return 'descending'
      else
        return 'ascending'
    else
      return
  
  $scope.reverse = ->
    $scope.reverseSort = !$scope.reverseSort
    $scope.order = if $scope.reverseSort then 'Descending' else 'Ascending'
  $scope.getSortValue = (champ)->
    if $scope.sortKey
      sortKey = $scope.convertReverse($scope.sortKey)
      return parseFloat($scope.perLevelV(sortKey, champ.actorStats))
    else
      return champ.playerData.playerDisplayName
  $scope.search = (champion)->
    if $scope.searchQuery.name
      LCsearch = $scope.searchQuery.name.toLowerCase()
      LCsearch2 = $scope.searchQuery.name2.toLowerCase()
      LCname = champion.playerData.playerDisplayName.toLowerCase()
      decision = LCname.indexOf(LCsearch) > -1 or (LCsearch2.length > 1 and LCname.indexOf(LCsearch2) > -1)
      return decision
    else
      return true
  $scope.spellKeys = {
    spellRange: 'Range'
    castDelay: 'Delay'
    spellCoolDown: 'CD'
    damage: 'Damage'
    damageRatio: 'Scaling'
    spellArea: 'AOE'
    spellDuration: 'Duration'
  }
  $scope.statsKeysExcludes = {
    lifeSteal: true
    pLevel: true
    valueScore: true
    visionDistance: true
    spellVamp: true
    weaponType: true
  }
  $scope.statsKeys = ->
    if $scope.statsKeysCache
      return $scope.statsKeysCache
    stats = []
    if $scope.champs[0]
      for stat in Object.keys($scope.champs[0].actorStats)
        if stat not in $scope.statsKeysExcludes
          stats.push(stat)
    $scope.statsKeysCache = stats
    return stats
  $scope.refresh = ->
    $scope.$digest()
  # should refactor these tables into service
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
    aggroRange: 'Aggro Range'
  }
  $scope.convertReverse = (key)->
    if key is 'AD'
      return 'attackDamage'
    if key is 'AS'
      return 'attackSpeed'
    if key is 'Range'
      return 'attackRange'
    if key is 'Crit %'
      return 'criticalChance'
    if key is 'Crit Damage'
      return 'criticalDamage'
    if key is 'Armor Pen'
      return 'armorPenetration'
    if key is 'Armor'
      return 'armor'
    if key is 'HP'
      return 'health'
    if key is 'HP Regen'
      return 'healthRegeneration'
    if key is 'MR'
      return 'spellResist'
    if key is 'AP'
      return 'spellDamage'
    if key is 'CDR'
      return 'coolDownReduction'
    if key is 'Movespeed'
      return 'speed'
    if key is 'Magic Pen'
      return 'spellPenetration'
    if key is 'Aggro Range'
      return 'aggroRange'
    return key
  $scope.perLevel = (stat, actorStats)->
    perLevelStat = stat + 'PerLevel'
    if actorStats[perLevelStat]
      if stat is 'attackSpeed'
        return ' (-' + actorStats[perLevelStat] + ')'
      else
        return ' (+' + actorStats[perLevelStat] + ')'
  $scope.perLevelV = (stat, actorStats)->
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

  $scope.switchView = ->
    console.log 'switchingView'
    $scope.grid = !$scope.grid
    $scope.sortKey = undefined
    $scope.order = 'Ascending'
    $scope.reverseSort = false
    if $scope.grid
      $scope.sortButton = 'Reverse Order'
    else
      $scope.sortButton = 'Use table headers to sort'
  $scope.selectHero = (heroName, hero)->
    if $scope.searchQuery.name isnt heroName
      $scope.searchQuery.name = heroName
    else
      $scope.searchQuery.name = ''
    if $scope.selectedHero isnt hero.name
      $scope.selectedHero = hero.name
      Builder.addHero(hero)
    else
      $scope.selectedHero = undefined
      Builder.removeHero()
  $scope.heroButton = (heroName)->
    if $scope.searchQuery.name isnt heroName
      return 'blue'
    else
      return 'red'

  $scope.addBuild = (hero)->
    $scope.selectedHero = hero.name
    Builder.addHero(hero)
  $scope.selectHeroBuild = (name)->
    if name is $scope.selectedHero
      return 'red'
    else
      return 'blue'
  $scope.avatarUrl = (hero)->
    urlname = hero.name
    if hero.name is 'flame'
      urlname = 'flameprincess'
    else if hero.name is 'princessbubblegum'
      urlname = 'pb'
    url = "http://i.cdn.turner.com/toon/games/adventuretime/adventure-time-battle-party/assets/img/champions-icon-" + urlname + ".jpg"
    return url