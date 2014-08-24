'use strict';

var _ = require('lodash');
var Champions = require('./champions.model');
var request = require('request');
var ATBP_JSON = require('../atbp.json')
//request('http://www.cartoonnetwork.com/games/adventuretime/adventure-time-battle-party/assets/data/atbp.json',
//    function(error, response, body){
//        if (!error && response.statusCode == 200){
//            console.log('successful get for champions')
//            ATBP_JSON = JSON.parse(body)
//        }else{
//            console.log('error getting champions ' + error)
//        }
//    }
//)
// Get list of championss
exports.index = function(req, res) {
    if(ATBP_JSON){
        return res.json(ATBP_JSON.Actors)
    }
};

function handleError(res, err) {
  return res.send(500, err);
}