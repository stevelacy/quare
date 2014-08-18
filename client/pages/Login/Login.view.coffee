page = require "page"
React = require "react"
Fission = require "../../vendor/fission"

{div, h1, button, a, img} = React.DOM

module.exports = ->

  Fission.view
    twitter: ->
      window.location = "/auth/twitter"
    render: ->

      div {className: "login-page"},

        div {},
          img {src: "/img/logo.png"}

        button {className: "button blue", onClick: @twitter}, "TWITTER"
