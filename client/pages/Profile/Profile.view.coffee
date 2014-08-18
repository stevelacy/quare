React = require "react"
Fission = require "../../vendor/fission"
User = require "../../models/User"

{div, h2, h3, img, p, span, a} = React.DOM

module.exports = ->

  Fission.modelView
    model: User

    render: ->

      div {className: "profile"},
        div {className: "user"},
          div {className: "image"},
            img {src: "#{@model.get('image')}"},
          div {className: "info"},
            h2 {}, "#{@model.get('name')}"
            h3 {}, "@#{@model.get('handle')}"
