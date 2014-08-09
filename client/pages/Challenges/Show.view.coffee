define (require) ->

  {div, h1, h2, h3, i, button, br, span, img, p, b, header, a, textarea} = React.DOM
  Dermis = require 'vendor/dermis'

  Dermis.modelView
    model: require 'models/Challenge'
    mounted: ->
      _this = @

      $('.modal .icon-close').click ->
        _this.closeModal $(this).closest('.modal')
        false

      map = L.mapbox.map('map', 'illanti.in9ig8o9', { zoomControl: false }).setView([40, -74.50], 6)
      featureLayer = L.mapbox.featureLayer().addTo(map)

      # Disable drag and zoom handlers.
      map.dragging.disable()
      map.touchZoom.disable()
      map.doubleClickZoom.disable()
      map.scrollWheelZoom.disable()

      # Disable tap handler, if present.
      map.tap.disable() if map.tap

      map.locate()

      map.on "locationfound", (e) ->
        map.fitBounds e.bounds, { maxZoom: 16 }

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

    openModal: (elm) ->
      elm = $(elm) if typeof elm is 'string'
      elm.addClass 'active'

      $('body').addClass 'open-modal'

    closeModal: (elm) ->
      elm = $(elm) if typeof elm is 'string'
      elm.removeClass 'active'

      $('body').removeClass 'open-modal'

    saveForLater: ->
      @openModal '#saveForLaterModal'
      _this = @
      setTimeout ->
        $('#saveForLaterModal').fadeOut ->
          _this.closeModal '#saveForLaterModal'
          $('#saveForLaterModal').fadeIn()
      , 2000

    claimImpact: ->
      @openModal '#claimImpactModal'

    share: ->
      @openModal '#shareModal'

    render: ->
      div {},
        div {className: "challenge"},
          div {className: "intro"},
            div {className: "intro-blur"}
            div {className: "intro-overlay"},
              span {className: "intro-duration"}, "2 Min"
              span {className: "intro-title"}, "Find the perfect wheels"
          div {className: "action-panel"},
            a {className: "action-block remindme-action", href: "", onClick: @saveForLater},
              i {className: "icon pu-icon icon-remindme"}
              span {}, "Save For Later"
            a {className: "action-block impact-action", href: "", onClick: @claimImpact},
              i {className: "icon pu-icon icon-impact-o"}
              span {}, "Claim Impact"
            a {className: "action-block share-action", href: "", onClick: @share},
              i {className: "icon pu-icon icon-share"}
              span {}, "Share Wisdom"
          div {className: "photos"},
            img {src: "http://a1.dspnimg.com/data/l/1213683097966_GFmzR8D3_l.jpg"}
            img {src: "http://bikepretty.com/wp-content/uploads/2013/01/lutyonline.png"}
            img {src: "http://blog.ljcfyi.com/images/2011/may2011/bikeVintage.jpg"}
          div {id: "map"}
          div {className: "block tips-and-advice"},
            a {className: "action-link", href: "#"}, "More"
            h2 {}, "Tips and Advice"
            div {className: "tip"},
              p {}, "Always wear a helmet when riding a bicycle. Safety first!"
            div {className: "tip"},
              p {}, "Bicycles save more than gas. They save you money, keep you in shape, and help you experience your city in new ways."
              span {className: "location"}, "San Francisco"
          div {className: "block step-by-step"},
            a {className: "action-link", href: "#"}, "More"
            h2 {}, "Step-by-Step"

        div {className: "modal", id:"saveForLaterModal"},
          header {className: "bar bar-nav"},
            a {className: "icon icon-close pull-right", href: "#saveForLaterModal"}

          div {className: "content"},
            div {className: "content-padded"},
              i {className: "icon pu-icon icon-remindme"}
              h3 {}, "Saved For Later"

        div {className: "modal", id:"claimImpactModal"},
          header {className: "bar bar-nav"},
            a {className: "icon icon-close pull-right", href: "#claimImpactModal"}

          div {className: "content"},
            div {className: "content-padded"},
              i {className: "icon pu-icon icon-check"}
              h3 {}, "You're awesome"

        div {className: "modal", id:"shareModal"},
          header {className: "bar bar-nav"},
            a {className: "icon icon-close pull-right", href: "#shareModal"}

          div {className: "content"},
            div {className: "content-padded"},
              textarea {className: "styled"}
