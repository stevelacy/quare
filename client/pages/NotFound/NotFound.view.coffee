fission = require "../../app"
NavbarView = require "../../components/Navbar/View"

{div, i, p, a} = fission.React.DOM

module.exports = ->

  fission.view
    render: ->
      div {className: "main not-found"},
        NavbarView()
        div {className: "page"},
          div {className: "header"}, "Page not found"
          p {}, "The page you tried to reach does not exist. Sorry about that."
          a {href: "/"}, "Go Home"
