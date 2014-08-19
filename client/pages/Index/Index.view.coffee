React = require "react"
Fission = require "../../vendor/fission"

{div, h1, button, br, span, img, a} = React.DOM

module.exports = ->

  Fission.view
    render: ->
      div {className: "main"},

        a {className: "button", href: "/profile"}, "Click me"
        br {},
        img {src: "/img/user.png"}

        div {}, "This is the index page..."
