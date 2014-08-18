React = require "react"
Fission = require "../../vendor/fission"

{header, h1, img, a, div, span, p, button} = React.DOM

module.exports = ->
  Fission.view
    render: ->
      div {className: "navbar"},
        a {href: "/profile"}, "Profile"
        h1 {className: "title"}, "Nav Bar"
        div {className: "right"},
          if window._user?
            div {className: "user"},
              div {className: "image"},
                img {src: "#{window._user.image}"}
