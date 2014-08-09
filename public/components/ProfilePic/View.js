(function() {
  define(function(require) {
    var Dermis, img;
    img = React.DOM.img;
    Dermis = require('vendor/dermis');
    return Dermis.view({
      getDefaultProps: function() {
        return {
          size: 200
        };
      },
      render: function() {
        var retinaSize, src;
        retinaSize = this.props.size * 2;
        src = "http://graph.facebook.com/" + (this.props.user.get('prettyName'));
        src += "/picture?width=" + retinaSize;
        src += "&height=" + retinaSize;
        return this.transferPropsTo(img({
          className: 'profile-pic',
          src: src
        }));
      }
    });
  });

}).call(this);
