React = require "react"
Fission = require "../../vendor/fission"
ProfilePicView = require "../../components/ProfilePic/View"

{header, h1, img, a, div, span, p, button} = React.DOM


View = Fission.view
  render: ->
    color = "light"
    if @props?.color is "dark" then color = "dark"
    div {className: "navbar #{color}"},
      a {href: "/"},
        div {className: "logo"}, "Quare"
      div {className: "right"},
        if window._user?
          div {className: "user"},
            a {href: "/#{window._user._id}", className: "image"},
              ProfilePicView
                image: window._user.image
                size: 50


module.exports = View
