module.exports = ->
  {div, h1, button, br, span, img, a} = React.DOM
  Dermis = require "../../vendor/dermis"

  Dermis.view
    render: ->
      div {className: "main"},

        a {className: "button", href: "/profile"}, "Click me"
          img {src: "/img/ripple.png"}
        div {className: "greytext"},
          div {}, "A daily challenge to"
          div {}, "change the world, together."

