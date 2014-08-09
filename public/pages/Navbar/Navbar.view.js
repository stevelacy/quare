(function() {
  define(function(require) {
    return function(route, ctx) {
      var Dermis, a, app, button, div, h1, header, img, me, p, span, _ref;
      _ref = React.DOM, header = _ref.header, h1 = _ref.h1, img = _ref.img, a = _ref.a, div = _ref.div, span = _ref.span, p = _ref.p, button = _ref.button;
      Dermis = require('vendor/dermis');
      app = require('vendor/dermis').app;
      me = require('auth');
      return Dermis.view({
        gotoMap: function() {
          console.log('Going to Map');
          page('/map');
          return false;
        },
        gotoProfile: function() {
          console.log('Going to Profile');
          page('/profile');
          return false;
        },
        gotoChallenges: function() {
          console.log('Going to Challenges');
          page('/challenges');
          return false;
        },
        render: function() {
          if (route.path === '/challenges') {
            return header({
              className: 'bar bar-nav main-navbar'
            }, a({
              href: '#',
              className: 'icon pu-icon icon-profile pull-right',
              onClick: this.gotoProfile
            }), h1({
              className: 'title'
            }, 'Pick A Challenge'));
          } else if (route.path === '/challenges/1') {
            return header({
              className: 'bar bar-nav main-navbar'
            }, a({
              href: '#',
              className: 'icon pu-icon icon-back pull-left',
              onClick: this.gotoChallenges
            }), a({
              href: '#',
              className: 'icon pu-icon icon-profile pull-right',
              onClick: this.gotoProfile
            }), h1({
              className: 'title'
            }, 'Get A Bike'));
          } else if (route.path === '/profile') {
            return header({
              className: 'bar bar-nav main-navbar'
            }, a({
              href: '#',
              className: 'icon pu-icon icon-back pull-left',
              onClick: this.gotoChallenges
            }), h1({
              className: 'title'
            }, 'Me'));
          } else if (route.path === '/intro' || route.path === '/') {
            return header({
              className: 'bar bar-nav main-navbar bar-nav-dark'
            });
          } else {
            return header({
              className: 'bar bar-nav main-navbar'
            }, a({
              href: '#',
              className: 'icon pu-icon icon-back pull-left',
              onClick: this.gotoChallenges
            }), h1({
              className: 'title'
            }, 'Not Found'));
          }
        }
      });
    };
  });

}).call(this);
