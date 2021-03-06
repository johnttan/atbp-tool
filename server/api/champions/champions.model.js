'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var ChampionsSchema = new Schema({
  name: String,
  info: String,
  active: Boolean
});

module.exports = mongoose.model('Champions', ChampionsSchema);