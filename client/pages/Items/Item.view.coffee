React = require "react"
Fission = require "../../vendor/fission"
Item = require '../../models/Item'
{div} = React.DOM


View = Fission.modelView
  model: Item
  render: ->
    console.log @model.get "contents"
    div {}, "that item #{@model.get 'contents'}"

module.exports = View
