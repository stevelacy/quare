React = require "react"
Fission = require "../../vendor/fission"
User = require "../../models/User"

{div, h2, h3, img, p, span, a} = React.DOM

module.exports = ->

  Fission.modelView
    model: new User()

    render: ->

      div {className: "profile-page"},
        div {className: "block user-details"},
          div {className: "user-photo"},
            img {src: "/img/demo/user-1.jpg"}
          div {className: "user-info"},
            div {className: "padder"},
              h3 {}, "Carson Linforth Bowley"
              p {className: "location"}, "San Francisco"
              p {className: "impact-score"},
                span {}, "Items: #{@model}"
