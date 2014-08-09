(function() {
  define(function(require) {
    var Dermis;
    Dermis = require('vendor/dermis');
    return Dermis.model({
      idAttribute: '_id',
      name: 'User'
    });
  });

}).call(this);
