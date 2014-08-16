React = require "react"
Fission = require "../../vendor/fission"

{div, i, p, a} = React.DOM

module.exports = ->

  Fission.view
    render: ->
      div {className: "icon message"},
        i {className: "attention icon"}
        div {className: "content"},
          div {className: "header"}, "Page not found"
          p {}, "The page you tried to reach does not exist. Sorry about that."
          a {href: "/"}, "Go Home"
