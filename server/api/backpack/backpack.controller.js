'use strict';

var _ = require('lodash');
var Backpack = require('./backpack.model');
var ATBP_JSON = require('../atbp.json')

// Get list of backpacks
exports.index = function(req, res) {
  return res.json({'Belts':ATBP_JSON.Belts, 'Junk':ATBP_JSON.Junk})
};

// Get a single backpack
exports.show = function(req, res) {
  Backpack.findById(req.params.id, function (err, backpack) {
    if(err) { return handleError(res, err); }
    if(!backpack) { return res.send(404); }
    return res.json(backpack);
  });
};

// Creates a new backpack in the DB.
exports.create = function(req, res) {
  Backpack.create(req.body, function(err, backpack) {
    if(err) { return handleError(res, err); }
    return res.json(201, backpack);
  });
};

// Updates an existing backpack in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Backpack.findById(req.params.id, function (err, backpack) {
    if (err) { return handleError(res, err); }
    if(!backpack) { return res.send(404); }
    var updated = _.merge(backpack, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.json(200, backpack);
    });
  });
};

// Deletes a backpack from the DB.
exports.destroy = function(req, res) {
  Backpack.findById(req.params.id, function (err, backpack) {
    if(err) { return handleError(res, err); }
    if(!backpack) { return res.send(404); }
    backpack.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};

function handleError(res, err) {
  return res.send(500, err);
}