React = require "react"
Fission = require "../../vendor/fission"

Item = require "../../models/Item"
ItemView = require "./Item.view"
{div} = React.DOM


View = Fission.collectionView
  model: Item
  itemView: ItemView
  render: ->
    return div {} unless @items[0]
    console.log @items
    div {}, "so..."

module.exports = View
