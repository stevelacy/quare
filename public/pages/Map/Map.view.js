(function() {
  define(function(require) {
    var Dermis, div, h2, p, _ref;
    _ref = React.DOM, div = _ref.div, h2 = _ref.h2, p = _ref.p;
    Dermis = require('vendor/dermis');
    return Dermis.view({
      mounted: function() {
        var featureLayer, map;
        map = L.mapbox.map('map', 'illanti.in9ig8o9').setView([40, -74.50], 9);
        featureLayer = L.mapbox.featureLayer().addTo(map);
        map.locate();
        map.on("locationfound", function(e) {
          map.fitBounds(e.bounds);
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
      render: function() {
        return div({
          className: "map-page content-padded"
        }, h2({}, 'Map View'), div({
          id: "map"
        }));
      }
    });
  });

}).call(this);
