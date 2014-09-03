fission = require "../../app"
Item = require "../../models/Item"
{div, img} = fission.React.DOM

View =  fission.modelView
  model: Item
  remove: ->
    console.log 'destroy'
    @model.destroy()
  render: ->
    div {className: "item"},
      img {onClick: @remove, src: @model.get 'content'}


module.exports = View
