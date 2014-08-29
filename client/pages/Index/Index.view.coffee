React = require "react"
Fission = require "../../vendor/fission"
NavbarView = require "../../components/Navbar/View"
router = require "../../router"

{div, h1, button, br, span, img, a} = React.DOM

module.exports = ->
  return window.location = "/login" unless window._user?

  Fission.view
    render: ->
      div {className: "main index"},
        NavbarView
          color: "dark"
        div {className: "page"},
          br {},
          img {src: "/img/user.png"}

          a {className: "button", href: "/53f23c21a23a3a4a1d6c0822"}, "Profile"
          br {}
          a {className: "button", href: "/items"}, "Items"
