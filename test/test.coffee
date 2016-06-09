assert = require 'assert'
should = require('chai').should()
hotslogs = require '../lib/index.js'
_ = require 'lodash'

describe 'node-hotslogs', ->
  describe '#getEvents', ->
    it 'should return an array of events', (done) ->
      hotslogs.getEvents()
      .then (events) ->
        return done new Error "Not an array" unless _.isArray events
        return done new Error "Array is empty" unless events.length > 0
        return done new Error "Invalid event data" unless events[0].EventID?
        done()
      .catch done

  describe '#getEvent(eventId)', ->
    it 'should return an event', (done) ->
      hotslogs.getEvent 1001
      .then (event) ->
        return done new Error "Invalid event data" unless event.ID?
        done()
      .catch done

  describe '#getPlayer(playerId)', ->
    it 'should return a player', (done) ->
      hotslogs.getPlayer 2947680
      .then (player) ->
        return done new Error "Wrong player" unless player.Name is 'vichle'
        done()
      .catch done

  describe '#getPlayer(region, battleTag)', ->
    it 'should return a player', (done) ->
      hotslogs.getPlayer hotslogs.REGIONS.EU, 'vichle#1737'
      .then (player) ->
        return done new Error "Wrong player" unless player.Name is 'vichle'
        done()
      .catch done

  describe '#getEventTrees', ->
    it 'should return an event tree', (done) ->
      hotslogs.getEventTrees()
      .then (eventTrees) ->
        return done new Error "Not an array" unless _.isArray eventTrees
        return done new Error "Array is empty" unless eventTrees.length > 0
        return done new Error "EventChildren is not an array" unless _.isArray eventTrees[0].EventChildren

        for eventTree in eventTrees
          return done() if eventTree.EventChildren.length > 0
        done new Error "Not an event tree"
      .catch done

  describe '#getHeroes', ->
    it 'should return an array of heroes', (done) ->
      hotslogs.getHeroes()
      .then (heroes) ->
        return done new Error "Not an array" unless _.isArray heroes
        return done new Error "Array is empty" unless heroes.length > 0
        return done new Error "Invalid hero data" unless heroes[0].PrimaryName?
        done()

  describe '#getMaps', ->
    hotslogs.getMaps()
    .then (maps) ->
      return done new Error "Not an array" unless _.isArray maps
      return done new Error "Array is empty" unless maps.length > 0
      return done new Error "Invalid map data" unless maps[0].PrimaryName?
      done()
