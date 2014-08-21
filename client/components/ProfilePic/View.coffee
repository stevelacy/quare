React = require "react"
Fission = require "../../vendor/fission"

{img} = React.DOM

View = Fission.view
  getDefaultProps: -> {size: 20}
  render: ->

    pic = img
      className: 'profile-pic'
      src: @props.image
      height: @props.size
      width: @props.size
    @transferPropsTo pic

module.exports = View
