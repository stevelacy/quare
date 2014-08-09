(function() {
  define(function(require) {
    var auth;
    auth = require('auth');
    return function(ctx, next) {
      return auth(function(me) {
        if (me != null) {
          return next();
        } else {
          if (window.location.pathname !== "/login") {
            window.location.href = "/login";
          }
          return next();
        }
      });
    };
  });

}).call(this);
