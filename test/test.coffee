assert = require('chai').assert
should = require('chai').should()
hotslogs = require '../lib/index.js'
_ = require 'lodash'

firstEventId = null

describe 'node-hotslogs', ->
  describe '#getEvents', ->
    it 'should return an array of events', ->
      hotslogs.getEvents()
      .then (events) ->
        assert _.isArray(events), "Not an array"
        assert events.length > 0, "Array is empty"
        assert events[0].EventID?, "Invalid event data"
        firstEventId = events[0].EventID
    .timeout 5000

  describe '#getEvent(eventId)', ->
    it 'should return an event', ->
      assert firstEventId?, "No firstEventId found"
      hotslogs.getEvent firstEventId
      .then (event) ->
        assert event?, 'No event'
        assert event.ID?, 'Invalid event'
    .timeout 15000 # If the topmost event is the one thats being fetched, it can take a long time :(

  describe '#getPlayer(playerId)', ->
    it 'should return a player', ->
      hotslogs.getPlayer 2947680
      .then (player) ->
        assert player.Name is 'vichle', "Wrong player"

  describe '#getPlayer(region, battleTag)', ->
    it 'should return a player', ->
      hotslogs.getPlayer hotslogs.REGIONS.EU, 'vichle#1737'
      .then (player) ->
        assert player.Name is 'vichle', "Wrong player"

  describe '#getEventTrees', ->
    it 'should return an event tree', ->
      hotslogs.getEventTrees()
      .then (eventTrees) ->
        assert _.isArray eventTrees, "Not an array"
        assert eventTrees.length > 0, "Array is empty"
        assert _.isArray eventTrees[0].EventChildren, "EventChildren is not an array"

  describe '#getHeroes', ->
    it 'should return an array of heroes', ->
      hotslogs.getHeroes()
      .then (heroes) ->
        assert _.isArray heroes, "Not an array"
        assert heroes.length > 0, "Array is empty"
        assert heroes[0].PrimaryName?, "Invalid hero data"

  describe '#getMaps', ->
    it 'should return map data', ->
      hotslogs.getMaps()
      .then (maps) ->
        assert _.isArray maps, "Not an array"
        assert maps.length > 0, "Array is empty"
        assert maps[0].PrimaryName?, "Invalid map data"
