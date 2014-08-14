module.exports = ->
  {header, h1, img, a, div, span, p, button} = React.DOM

  Dermis = require "../../vendor/dermis"

  Dermis.view
    render: ->
      header {className: "bar bar-nav main-navbar"},
        a {href: "/profile"}, "Profile"
        h1 {className: "title"}, "Nav Bar"
