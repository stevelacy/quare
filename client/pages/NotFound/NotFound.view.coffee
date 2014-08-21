React = require "react"
Fission = require "../../vendor/fission"
NavbarView = require "../../components/Navbar/View"

{div, i, p, a} = React.DOM

module.exports = ->

  Fission.view
    render: ->
      div {className: "main not-found"},
        NavbarView()
        div {className: "page"},
          div {className: "header"}, "Page not found"
          p {}, "The page you tried to reach does not exist. Sorry about that."
          a {href: "/"}, "Go Home"
