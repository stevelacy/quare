fission = require "../../app"
NavbarView = require "../../components/Navbar/View"
Item = require "../../models/Item"
ItemView = require "./Item.view"
{div, input} = fission.React.DOM

module.exports = ->
  return window.location = "/login" unless window._user?
  fission.collectionView
    model: Item
    itemView: ItemView
    getInitialState: ->
      isOpen: false
    handleKeyUp: (e) ->
      if e.which == 27
        return @setState isOpen: !@state.isOpen
      if e.which == 13
        @collection.create
          content: @state.url
        return @setState isOpen: false

    handleChange: (e) ->
      @setState url: e.target.value
    toggleNew: ->
      if @state.isOpen
        return input {type: "text", className: "url", placeholder: "Enter image url", onKeyUp: @handleKeyUp, onChange: @handleChange}
      return div {onClick: @new},"+"
    toggleClass: ->
      if @state.isOpen
        return "open"
      return "closed"
    new: ->
      @setState isOpen: !@state.isOpen

    render: ->
      div {className: "main items"},
        NavbarView
          color: "light"
          background: "bg-dark"
        div {className: "new"},
          div {className: "plus #{@toggleClass()}"}, @toggleNew()
        @items.map (item) ->
          item

