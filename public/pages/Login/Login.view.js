(function() {
  define(function(require) {
    var Dermis, br, button, div, firebase, h1, img, span, _ref;
    _ref = React.DOM, div = _ref.div, h1 = _ref.h1, button = _ref.button, br = _ref.br, span = _ref.span, img = _ref.img;
    Dermis = require('vendor/dermis');
    firebase = require('firebase');
    return Dermis.view({
      login: function() {
        var auth;
        console.log(firebase);
        return auth = new FirebaseSimpleLogin(firebase, function(error, user) {
          auth.login('password', {
            email: 'aaron@wearefractal.com',
            password: 'test'
          });
          return page('/');
        });
      },
      render: function() {
        return div({
          className: "login-page content-padded"
        }, div({}, img({
          src: '/img/ripple.png'
        })), div({
          className: 'greytext'
        }, div({}, "A daily challenge to"), div({}, "change the world, together.")), br({}), button({
          className: 'button',
          onClick: this.login
        }, "LOGIN"));
      }
    });
  });

}).call(this);
