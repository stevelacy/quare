(function() {
  define(function(require) {
    return function(ctx, next) {
      console.log('Routing called', ctx);
      return next();
    };
  });

}).call(this);
