(function() {
  define(function(require) {
    var Dermis, br, button, div, h1, h2, i, img, p, span, strong, _ref;
    _ref = React.DOM, div = _ref.div, h1 = _ref.h1, h2 = _ref.h2, button = _ref.button, br = _ref.br, span = _ref.span, img = _ref.img, i = _ref.i, p = _ref.p, strong = _ref.strong;
    Dermis = require('vendor/dermis');
    return Dermis.view({
      goChallenges: function() {
        return page("/challenges");
      },
      render: function() {
        return div({
          className: "intro-page"
        }, div({
          className: "slider",
          id: "introSlider"
        }, div({
          className: "slide-group"
        }, div({
          className: "slide"
        }, div({
          className: ""
        }, i({
          className: 'icon pu-icon icon-speech'
        }), h2({}, "Get Informed"), p({}, "What can ", strong({}, "you"), " do about climate change?"))), div({
          className: "slide"
        }, div({
          className: ""
        }, i({
          className: 'icon pu-icon icon-flag'
        }), h2({}, "Take Action"), p({}, "Do ", strong({}, "simple actions"), " that add up to big change for the planet."))), div({
          className: "slide"
        }, div({
          className: ""
        }, i({
          className: 'icon pu-icon icon-check'
        }), h2({}, "Take Action"), p({}, strong({}, "Earn badges"), " for your awesome new habits."), div({
          className: 'actions'
        }, span({
          className: 'btn btn-primary btn-block',
          onClick: this.goChallenges
        }, "Get Started")))))));
      }
    });
  });

}).call(this);
