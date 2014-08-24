'use strict';

var _ = require('lodash');
var Backpack = require('./backpack.model');
var ATBP_JSON = require('../atbp.json')

// Get list of backpacks
exports.index = function(req, res) {
  return res.json({'Belts':ATBP_JSON.Belts, 'Junk':ATBP_JSON.Junk})
};

