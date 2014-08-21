React = require "react"
Fission = require "../../vendor/fission"
NavbarView = require "../../components/Navbar/View"
ProfilePicView = require "../../components/ProfilePic/View"
checkAuth = require "../../checkAuth"
User = require "../../models/User"

{div, h1, h2, h3, img, p, span, a} = React.DOM

module.exports = ->
  checkAuth()

  background = (bg) ->
    img {className: "background", src: "#{bg}"},

  Fission.modelView
    model: User
    handle: @args.params.user

    render: ->
      div {className: "main profile"},
        background @model.get "background"
        div {className: "shadow"}
        NavbarView
          color: "dark"
        div {className: "user-box"},
          div {className: "image"},
            ProfilePicView
              image: @model.get "image"
              size: 200

          div {className: "info"},
            h1 {}, "#{@model.get 'name' }"
            h2 {}, "@#{@model.get 'handle' }"
