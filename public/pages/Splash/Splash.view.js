(function() {
  define(function(require) {
    var Dermis, br, button, div, h1, img, span, _ref;
    _ref = React.DOM, div = _ref.div, h1 = _ref.h1, button = _ref.button, br = _ref.br, span = _ref.span, img = _ref.img;
    Dermis = require('vendor/dermis');
    return Dermis.view({
      goNext: function() {
        return page('/intro');
      },
      render: function() {
        return div({
          className: "splash-page",
          onClick: this.goNext
        }, div({}, img({
          src: '/img/ripple.png'
        })), div({
          className: 'greytext'
        }, div({}, "A daily challenge to"), div({}, "change the world, together.")));
      }
    });
  });

}).call(this);
