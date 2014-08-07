'use strict';

var _ = require('lodash');
var Champions = require('./champions.model');
var request = require('request');
var ChampionsJSON = undefined
request('http://www.cartoonnetwork.com/games/adventuretime/adventure-time-battle-party/assets/data/atbp.json',
    function(error, response, body){
        if (!error && response.statusCode == 200){
            console.log('successful get for champions')
            ChampionsJSON = JSON.parse(body)
        }else{
            console.log('error getting champions ' + error)
        }
    }
)
// Get list of championss
exports.index = function(req, res) {
    if(ChampionsJSON){
        console.log(typeof ChampionsJSON)
        res.json(ChampionsJSON.Actors)
    }
};

// Get a single champions
exports.show = function(req, res) {
  Champions.findById(req.params.id, function (err, champions) {
    if(err) { return handleError(res, err); }
    if(!champions) { return res.send(404); }
    return res.json(champions);
  });
};

// Creates a new champions in the DB.
exports.create = function(req, res) {
  Champions.create(req.body, function(err, champions) {
    if(err) { return handleError(res, err); }
    return res.json(201, champions);
  });
};

// Updates an existing champions in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Champions.findById(req.params.id, function (err, champions) {
    if (err) { return handleError(res, err); }
    if(!champions) { return res.send(404); }
    var updated = _.merge(champions, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.json(200, champions);
    });
  });
};

// Deletes a champions from the DB.
exports.destroy = function(req, res) {
  Champions.findById(req.params.id, function (err, champions) {
    if(err) { return handleError(res, err); }
    if(!champions) { return res.send(404); }
    champions.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};

function handleError(res, err) {
  return res.send(500, err);
}