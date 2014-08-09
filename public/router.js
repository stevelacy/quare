(function() {
  define(function(require) {
    var APPNAME, app, middleware, _ref;
    _ref = require("vendor/dermis"), app = _ref.app, middleware = _ref.middleware;
    APPNAME = _serverConfig.name;
    app.use(middleware.clearFB);
    app.use(middleware.log);
    app.use({
      view: "pages/Navbar/Navbar.view",
      el: "navbar"
    });
    app.route("/login", {
      title: "" + APPNAME + " - Login",
      view: "pages/Login/Login.view",
      el: "content",
      "continue": false
    });
    app.route("/profile", {
      title: "" + APPNAME + " - Profile",
      view: "pages/Profile/Profile.view",
      el: "content",
      "continue": false
    });
    app.route('/challenges', {
      title: "" + APPNAME + " - Challenges",
      view: 'pages/Challenges/Index.view',
      el: 'content',
      "continue": false
    });
    app.route("/", {
      title: "" + APPNAME,
      view: "pages/Index/Index.view",
      el: "content",
      "continue": false
    });
    app.use({
      title: "" + APPNAME + " - Not found",
      view: "pages/NotFound/NotFound.view",
      el: "content",
      "continue": false
    });
    return app;
  });

}).call(this);
