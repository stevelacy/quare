fission = require "../../app"
NavbarView = require "../../components/Navbar/View"

{div, h1, button, a, img, br} = fission.React.DOM

module.exports = ->

  fission.view
    twitter: ->
      window.location = "/auth/twitter"
    render: ->
      div {className: "main login"},
        NavbarView
          color: "light"
        div {className: "page"},
          div {className: "login"},

            div {className: "logo white"}, "Login to get started"
            div {className: "spacer-50"}
            button {className: "button blue large wide center", onClick: @twitter}, "TWITTER"
