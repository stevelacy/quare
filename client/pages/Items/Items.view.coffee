React = require "react"
Fission = require "../../vendor/fission"
NavbarView = require "../../components/Navbar/View"
Item = require "../../models/Item"
ItemView = require "./Item.view"
{div} = React.DOM

module.exports = ->
  return window.location = "/login" unless window._user?
  Fission.collectionView
    model: Item
    itemView: ItemView
    render: ->
      div {className: "main items"},
        NavbarView
          color: "light"
          background: "bg-dark"
        @items.map (item) ->
          item

