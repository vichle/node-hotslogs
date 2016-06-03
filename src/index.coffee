superagent = require 'superagent'
_ = require 'lodash'

API_URL = "https://api.hotslogs.com/Public"

getPromise = (url) ->
  return new Promise (resolve, reject) ->
    superagent
      .get url
      .end (err, res) ->
        return reject err if err?
        return resolve res.body

createTrees = (nodes, parentId, idField, parentIdField) ->
  thisLevelNodes = _.remove nodes, (node) -> node[parentIdField] is parentId
  for node in thisLevelNodes
    node.EventChildren = createTrees nodes, node[idField], idField, parentIdField
  return thisLevelNodes

hotslogs =
  REGIONS:
    US: 1
    EU: 2
    KR: 3
    CN: 5

  getEvents: -> getPromise "#{API_URL}/Events"

  getEvent: (eventId) -> getPromise "#{API_URL}/Events/#{eventId}"

  getEventTrees: ->
    hotslogs
      .getEvents()
      .then (events) ->
        createTrees(events, null, 'EventID', 'EventIDParent')

  getPlayer: (region, battleTag) ->
    if battleTag?
      battleTag = battleTag.replace '#', '_'
      return getPromise "#{API_URL}/Players/#{region}/#{battleTag}"
    else
      playerId = region
      return getPromise "#{API_URL}/Players/#{playerId}"

module.exports = hotslogs
