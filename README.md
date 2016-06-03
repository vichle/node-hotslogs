# node-hotslogs
Node-wrapper for HOTSLogs API (with some sugar)

## Install
```
npm install node-hotslogs
```

## Usage
```js
hotslogs = require('node-hotslogs');

hotslogs.getEvents().then(function(events){...});
hotslogs.getEvent(1001).then(function(event){...});
hotslogs.getEventTrees().then(function(eventTrees){...});
hotslogs.getPlayer(1).then(function(player){...});
hotslogs.getPlayer(hotslogs.REGIONS.EU,"battletag#0000").then(function(player){...});
```

## License
MIT
