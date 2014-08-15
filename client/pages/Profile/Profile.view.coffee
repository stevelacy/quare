module.exports = ->
  {div, h2, h3, img, p, span, a} = React.DOM
  Dermis = require "../../vendor/dermis"
  ProfileModel = require "../../models/User"

  Dermis.view
    model: ProfileModel

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
