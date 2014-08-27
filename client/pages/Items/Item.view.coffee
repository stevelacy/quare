React = require "react"
Fission = require "../../vendor/fission"
Item = require "../../models/Item"
{div, img} = React.DOM

View =  Fission.modelView
  model: Item
  render: ->
    div {className: "item"},
      img {src: @model.get 'content'}


module.exports = View
