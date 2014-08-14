module.exports = ->
  {div, i, p, a} = React.DOM

  Dermis = require "../../vendor/dermis"

  Dermis.view
    goHome: ->
      page "/"
    render: ->
      div {className: "icon message"},
        i {className: "attention icon"}
        div {className: "content"},
          div {className: "header"}, "Page not found"
          p {}, "The page you tried to reach does not exist. Sorry about that."
          a {onClick: @goHome}, "Go Home"
