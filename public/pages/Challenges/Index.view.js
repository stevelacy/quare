(function() {
  define(function(require) {
    var Challenge, ChallengeSquare, Dermis, a, b, br, button, div, h1, header, img, p, span, _ref;
    _ref = React.DOM, div = _ref.div, h1 = _ref.h1, button = _ref.button, br = _ref.br, span = _ref.span, img = _ref.img, p = _ref.p, b = _ref.b, header = _ref.header, a = _ref.a;
    Dermis = require('vendor/dermis');
    ChallengeSquare = require('components/ChallengeSquare/View');
    Challenge = require('models/Challenge');
    return Dermis.collectionView({
      model: require('models/Challenge'),
      itemView: require('components/ChallengeSquare/View'),
      render: function() {
        var _ref1;
        if (this.items === null || ((_ref1 = this.items) != null ? _ref1.length : void 0) <= 0) {
          this.items = span({}, "No Matches right now!");
        }
        return div({}, div({
          className: "user-bar"
        }, span({
          className: "points"
        }, "280"), span({
          className: "welcome"
        }, "Konichiwa Carson")), div({
          className: "challenge-index-page"
        }, this.items));
      }
    });
  });

}).call(this);
