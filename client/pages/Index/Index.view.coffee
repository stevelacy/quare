React = require "react"
Fission = require "../../vendor/fission"
NavbarView = require "../../components/Navbar/View"
router = require "../../router"
checkAuth = require "../../checkAuth"

{div, h1, button, br, span, img, a} = React.DOM

module.exports = ->
  checkAuth()

  Fission.view
    render: ->
      div {className: "main index"},
        NavbarView
          color: "dark"
        div {className: "page"},
          a {className: "button", href: "/profile/53f23c21a23a3a4a1d6c0822"}, "Click me"
          br {},
          img {src: "/img/user.png"}

          div {}, "This is the index page..."
