{img} = React.DOM
Dermis = require '../vendor/dermis'

Dermis.view
  getDefaultProps: -> {size: 200}
  render: ->
    retinaSize = @props.size * 2
    src  = "http://graph.facebook.com/#{@props.user.get('prettyName')}"
    src += "/picture?width=#{retinaSize}"
    src += "&height=#{retinaSize}"

    @transferPropsTo(img {className: 'profile-pic', src: src})
