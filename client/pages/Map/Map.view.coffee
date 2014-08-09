define (require) ->

  {div, h2, p} = React.DOM
  Dermis = require 'vendor/dermis'

  Dermis.view
    mounted: ->
      map = L.mapbox.map('map', 'illanti.in9ig8o9').setView([40, -74.50], 9);
      featureLayer = L.mapbox.featureLayer().addTo(map);

      map.locate()

      map.on "locationfound", (e) ->
        map.fitBounds e.bounds
        featureLayer.setGeoJSON
          type: "Feature"
          geometry:
            type: "Point"
            coordinates: [
              e.latlng.lng
              e.latlng.lat
            ]

          properties:
            title: "Here I am!"
            "marker-color": "#ff8888"
            "marker-symbol": "star"

        return


      # If the user chooses not to allow their location
      # to be shared, display an error message.
      map.on "locationerror", ->
        console.log "Position could not be found"
        return


    render: ->

      div {className: "map-page content-padded"},

        h2 {}, 'Map View'
        div { id: "map" }

