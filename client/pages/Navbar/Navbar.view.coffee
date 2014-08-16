React = require "react"
Fission = require "../../vendor/fission"

{header, h1, img, a, div, span, p, button} = React.DOM

module.exports = ->
  Fission.view
    render: ->
      header {className: "header"},
        a {href: "/profile"}, "Profile"
        h1 {className: "title"}, "Nav Bar"
