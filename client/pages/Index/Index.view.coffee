fission = require "../../app"
NavbarView = require "../../components/Navbar/View"

{div, h1, button, br, span, img, a} = fission.React.DOM

module.exports = ->
  return window.location = "/login" unless window._user?

  fission.view
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
