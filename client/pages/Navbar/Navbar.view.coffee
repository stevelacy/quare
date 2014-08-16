module.exports = ->
  React = require "react"
  {header, h1, img, a, div, span, p, button} = React.DOM

  Fission = require "../../vendor/fission"

  Fission.view
    render: ->
      header {className: "header"},
        a {href: "/profile"}, "Profile"
        h1 {className: "title"}, "Nav Bar"
