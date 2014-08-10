define (require) ->

  (route, ctx) ->

    {header, h1, img, a, div, span, p, button} = React.DOM
    Dermis = require 'vendor/dermis'

    app = require('vendor/dermis').app
    me  = require 'auth'

    render: ->
      header {className: "bar bar-nav main-navbar"},
        a {href: "#", className: "icon pu-icon icon-back pull-left", onClick: @gotoChallenges}
        h1 {className: "title"}, "Not Found"
