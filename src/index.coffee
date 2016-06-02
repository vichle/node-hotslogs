superagent = require 'superagent'

API_URL = "https://api.hotslogs.com/Public"

getPromise = (url) ->
  return new Promise (resolve, reject) ->
    superagent
      .get url
      .end (err, res) ->
        return reject err if err?
        return resolve res.body

hotslogs =
  REGIONS:
    US: 1
    EU: 2
    KR: 3
    CN: 5

  getEvents: -> getPromise "#{API_URL}/Events"
  getEvent: (eventId) -> getPromise "#{API_URL}/Events/#{eventId}"
  getPlayer: (region, battleTag) ->
    if battleTag?
      battleTag = battleTag.replace '#', '_'
      return getPromise "#{API_URL}/Players/#{region}/#{battleTag}"
    else
      playerId = region
      return getPromise "#{API_URL}/Players/#{playerId}"

module.exports = hotslogs
