/**
 * Broadcast updates to client when the model changes
 */

'use strict';

var Backpack = require('./backpack.model');

exports.register = function(socket) {
  Backpack.schema.post('save', function (doc) {
    onSave(socket, doc);
  });
  Backpack.schema.post('remove', function (doc) {
    onRemove(socket, doc);
  });
}

function onSave(socket, doc, cb) {
  socket.emit('backpack:save', doc);
}

function onRemove(socket, doc, cb) {
  socket.emit('backpack:remove', doc);
}