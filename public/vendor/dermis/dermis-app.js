(function() {
  var __slice = [].slice;

  define(function(require) {
    var app, renderView;
    app = {};
    renderView = function(opt, cb) {
      if (opt == null) {
        opt = {};
      }
      if (typeof opt.view === 'function') {
        opt.view = opt.view(opt.args);
        return renderView(opt, cb);
      } else if (typeof opt.view === 'string') {
        return require([opt.view], function(vu) {
          opt.view = vu;
          return renderView(opt, cb);
        });
      } else {
        console.log('rendering', opt.view, 'into', opt.el);
        React.renderComponent(opt.view, opt.el);
        return cb();
      }
    };
    app.createRouteHandler = function(opt) {
      if (typeof opt === 'string') {
        return function(ctx, next) {
          return require([opt], function(fn) {
            return fn(ctx, next);
          });
        };
      } else {
        return app.createRenderHandler(opt);
      }
    };
    app.createRenderHandler = function(opt) {
      var handler;
      if (opt == null) {
        opt = {};
      }
      if (opt["continue"] == null) {
        opt["continue"] = true;
      }
      if (typeof opt.el === 'string') {
        opt.el = document.getElementById(opt.el);
      }
      handler = function(ctx, next) {
        var nopt;
        nopt = {
          el: opt.el,
          view: opt.view,
          args: ctx
        };
        return renderView(nopt, function() {
          if (opt.title != null) {
            document.title = opt.title;
          }
          if (opt["continue"]) {
            return next();
          }
        });
      };
      return handler;
    };
    app.route = function() {
      var handlers, route;
      route = arguments[0], handlers = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      handlers = handlers.map(app.createRouteHandler);
      page.apply(null, [route].concat(__slice.call(handlers)));
      return app;
    };
    app.router = page;
    app.use = app.route.bind(null, '*');
    app.start = page.start;
    return app;
  });

}).call(this);
