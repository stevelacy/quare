React = require "react"
Fission = require "../../vendor/fission"

{header, h1, img, a, div, span, p, button} = React.DOM


View = Fission.view
  render: ->
    color = "light"
    if @props?.color is "dark" then color = "dark"
    div {className: "navbar #{color}"},
      div {className: "logo"}, "Quare"
      div {className: "right"},
        if window._user?
          div {className: "user"},
            div {className: "image"},
              img {src: "#{window._user.image}"}


module.exports = View
