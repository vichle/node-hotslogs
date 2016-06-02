# node-hotslogs
Node-wrapper for HOTSLogs API

## Install

## Usage
```
hotslogs = require('hotslogs');

hotslogs.getEvents().then(function(events){...});
hotslogs.getEvent(1001).then(function(event){...});
hotslogs.getPlayer(1).then(function(player){...});
hotslogs.getPlayer(hotslogs.REGIONS.EU,"battletag#1737").then(function(player){...});
```

## License
MIT
