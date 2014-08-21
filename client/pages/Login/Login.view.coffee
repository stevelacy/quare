page = require "page"
React = require "react"
Fission = require "../../vendor/fission"
NavbarView = require "../../components/Navbar/View"

{div, h1, button, a, img, br} = React.DOM

module.exports = ->

  Fission.view
    twitter: ->
      window.location = "/auth/twitter"
    render: ->
      div {className: "main login"},
        NavbarView
          color: "light"
        div {className: "page"},

          div {className: "logo white"}, "Login"
          div {className: "spacer-50"}
          button {className: "button blue large wide center", onClick: @twitter}, "TWITTER"
