# node-hotslogs
Node-wrapper for HOTSLogs API (with some sugar)

## Install
```
npm install node-hotslogs
```

## Usage
```js
hotslogs = require('node-hotslogs');

hotslogs.getHeroes().then(function(heroes){...});
hotslogs.getMaps().then(function(maps){...});
hotslogs.getEvents().then(function(events){...});
hotslogs.getEvent(1001).then(function(event){...});
hotslogs.getEventTrees().then(function(eventTrees){...});
hotslogs.getPlayer(1).then(function(player){...});
hotslogs.getPlayer(hotslogs.REGIONS.EU,"battletag#0000").then(function(player){...});
```

## Contribute
Feel free to add sugar and/or help me keep this package up to date with the Hotslogs API!
Don't forget to add unit tests for all of your additions and please be consistent with regards to the code-style of the project.

### Tests
Run tests with
```
npm test
```
**Note:** Tests may timeout during peak hours as they rely on the speed of the Hotslogs API!

### TODO
* Better documentation
    - Examples of the returned data?
* Rename some event fields
    - Possibly an option to getEvent?

## License
MIT
