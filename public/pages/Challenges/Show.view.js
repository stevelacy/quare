(function() {
  define(function(require) {
    var Dermis, a, b, br, button, div, h1, h2, h3, header, i, img, p, span, textarea, _ref;
    _ref = React.DOM, div = _ref.div, h1 = _ref.h1, h2 = _ref.h2, h3 = _ref.h3, i = _ref.i, button = _ref.button, br = _ref.br, span = _ref.span, img = _ref.img, p = _ref.p, b = _ref.b, header = _ref.header, a = _ref.a, textarea = _ref.textarea;
    Dermis = require('vendor/dermis');
    return Dermis.modelView({
      model: require('models/Challenge'),
      mounted: function() {
        var featureLayer, map, _this;
        _this = this;
        $('.modal .icon-close').click(function() {
          _this.closeModal($(this).closest('.modal'));
          return false;
        });
        map = L.mapbox.map('map', 'illanti.in9ig8o9', {
          zoomControl: false
        }).setView([40, -74.50], 6);
        featureLayer = L.mapbox.featureLayer().addTo(map);
        map.dragging.disable();
        map.touchZoom.disable();
        map.doubleClickZoom.disable();
        map.scrollWheelZoom.disable();
        if (map.tap) {
          map.tap.disable();
        }
        map.locate();
        map.on("locationfound", function(e) {
          map.fitBounds(e.bounds, {
            maxZoom: 16
          });
          featureLayer.setGeoJSON({
            type: "Feature",
            geometry: {
              type: "Point",
              coordinates: [e.latlng.lng, e.latlng.lat]
            },
            properties: {
              title: "Here I am!",
              "marker-color": "#ff8888",
              "marker-symbol": "star"
            }
          });
        });
        return map.on("locationerror", function() {
          console.log("Position could not be found");
        });
      },
      openModal: function(elm) {
        if (typeof elm === 'string') {
          elm = $(elm);
        }
        elm.addClass('active');
        return $('body').addClass('open-modal');
      },
      closeModal: function(elm) {
        if (typeof elm === 'string') {
          elm = $(elm);
        }
        elm.removeClass('active');
        return $('body').removeClass('open-modal');
      },
      saveForLater: function() {
        var _this;
        this.openModal('#saveForLaterModal');
        _this = this;
        return setTimeout(function() {
          return $('#saveForLaterModal').fadeOut(function() {
            _this.closeModal('#saveForLaterModal');
            return $('#saveForLaterModal').fadeIn();
          });
        }, 2000);
      },
      claimImpact: function() {
        return this.openModal('#claimImpactModal');
      },
      share: function() {
        return this.openModal('#shareModal');
      },
      render: function() {
        return div({}, div({
          className: "challenge"
        }, div({
          className: "intro"
        }, div({
          className: "intro-blur"
        }), div({
          className: "intro-overlay"
        }, span({
          className: "intro-duration"
        }, "2 Min"), span({
          className: "intro-title"
        }, "Find the perfect wheels"))), div({
          className: "action-panel"
        }, a({
          className: "action-block remindme-action",
          href: "",
          onClick: this.saveForLater
        }, i({
          className: "icon pu-icon icon-remindme"
        }), span({}, "Save For Later")), a({
          className: "action-block impact-action",
          href: "",
          onClick: this.claimImpact
        }, i({
          className: "icon pu-icon icon-impact-o"
        }), span({}, "Claim Impact")), a({
          className: "action-block share-action",
          href: "",
          onClick: this.share
        }, i({
          className: "icon pu-icon icon-share"
        }), span({}, "Share Wisdom"))), div({
          className: "photos"
        }, img({
          src: "http://a1.dspnimg.com/data/l/1213683097966_GFmzR8D3_l.jpg"
        }), img({
          src: "http://bikepretty.com/wp-content/uploads/2013/01/lutyonline.png"
        }), img({
          src: "http://blog.ljcfyi.com/images/2011/may2011/bikeVintage.jpg"
        })), div({
          id: "map"
        }), div({
          className: "block tips-and-advice"
        }, a({
          className: "action-link",
          href: "#"
        }, "More"), h2({}, "Tips and Advice"), div({
          className: "tip"
        }, p({}, "Always wear a helmet when riding a bicycle. Safety first!")), div({
          className: "tip"
        }, p({}, "Bicycles save more than gas. They save you money, keep you in shape, and help you experience your city in new ways."), span({
          className: "location"
        }, "San Francisco"))), div({
          className: "block step-by-step"
        }, a({
          className: "action-link",
          href: "#"
        }, "More"), h2({}, "Step-by-Step"))), div({
          className: "modal",
          id: "saveForLaterModal"
        }, header({
          className: "bar bar-nav"
        }, a({
          className: "icon icon-close pull-right",
          href: "#saveForLaterModal"
        })), div({
          className: "content"
        }, div({
          className: "content-padded"
        }, i({
          className: "icon pu-icon icon-remindme"
        }), h3({}, "Saved For Later")))), div({
          className: "modal",
          id: "claimImpactModal"
        }, header({
          className: "bar bar-nav"
        }, a({
          className: "icon icon-close pull-right",
          href: "#claimImpactModal"
        })), div({
          className: "content"
        }, div({
          className: "content-padded"
        }, i({
          className: "icon pu-icon icon-check"
        }), h3({}, "You're awesome")))), div({
          className: "modal",
          id: "shareModal"
        }, header({
          className: "bar bar-nav"
        }, a({
          className: "icon icon-close pull-right",
          href: "#shareModal"
        })), div({
          className: "content"
        }, div({
          className: "content-padded"
        }, textarea({
          className: "styled"
        })))));
      }
    });
  });

}).call(this);
