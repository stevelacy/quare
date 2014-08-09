(function() {
  define(function(require) {
    var Dermis, b, div, h1, h2, h3, h4, header, hr, me, span, _ref;
    _ref = React.DOM, div = _ref.div, h1 = _ref.h1, h2 = _ref.h2, h3 = _ref.h3, h4 = _ref.h4, hr = _ref.hr, header = _ref.header, span = _ref.span, b = _ref.b;
    Dermis = require('vendor/dermis');
    me = require('auth');
    return Dermis.view({
      render: function() {
        return div({
          clasName: 'wave-page content'
        }, div({
          className: 'bar bar-nav'
        }, h1({
          className: 'title'
        }, "Today's Wave")), div({
          className: 'content wave-heading'
        }, div({
          className: 'wave-content'
        }, h1({}, "Ride a bike"), h4({}, "Go human-powered for the day"), div({
          className: 'actions'
        }, "Share a photo | Invite Friends | Share a tip"), div({
          className: 'info'
        }, h3({}, "Did you know?"), div({}, "More people commute by bicycle in Copenhagen than cycle to work in the entire United States")), div({}, h3({}, "Did you know?"), div({}, "More people commute by bicycle in Copenhagen than cycle to work in the entire United States")))));
      }
    });
  });

}).call(this);
