define (require) ->

  {div, h1, button, br, span, img, a} = React.DOM
  Dermis = require 'vendor/dermis'

  Dermis.view
    goNext: ->
      page '/profile'

    render: ->
      div {className: "main"},

        div {className: "button", onClick: @goNext}, "Click me"
          img {src: "/img/ripple.png"}
        div {className: "greytext"},
          div {}, "A daily challenge to"
          div {}, "change the world, together."
