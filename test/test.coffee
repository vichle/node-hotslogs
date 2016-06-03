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
        done()
      .catch done

  describe '#getEvent(eventId)', ->
    it 'should return an event', (done) ->
      hotslogs.getEvent 1001
      .then (event) ->
        return done new Error "Not an event" unless event.ID?
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
        return done new Error "Not an event tree" unless _.isArray eventTrees[0].EventChildren
        done()
      .catch done
