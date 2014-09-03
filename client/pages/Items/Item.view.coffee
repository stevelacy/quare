fission = require "../../app"
Item = require "../../models/Item"
{div, img} = fission.React.DOM

View =  fission.modelView
  model: Item
  render: ->
    div {className: "item"},
      img {src: @model.get 'content'}


module.exports = View
