(function() {
  define(function(require) {
    var Dermis, div, img, p, span, _ref;
    _ref = React.DOM, div = _ref.div, p = _ref.p, img = _ref.img, span = _ref.span;
    Dermis = require('vendor/dermis');
    return Dermis.modelView({
      model: require('models/Challenge'),
      openChallenge: function(a, b, c) {
        console.log('Going to challenge #', this.model.get('id'));
        return page('/challenges/1');
      },
      render: function() {
        var icon, id, score, state, title, _ref1;
        _ref1 = this.model.attributes, id = _ref1.id, title = _ref1.title, icon = _ref1.icon, score = _ref1.score, state = _ref1.state;
        return div({
          className: 'challenge-square ' + state,
          key: id,
          onClick: this.openChallenge
        }, div({
          className: 'challenge-square-inner'
        }, img({
          src: '/img/icons/' + icon
        }), p({
          className: 'challenge-title'
        }, title), p({
          className: 'impact-score'
        }, span({}, score))));
      }
    });
  });

}).call(this);
