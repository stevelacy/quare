{div, i, p} = React.DOM

Dermis = require "../../vendor/dermis"

Dermis.view

  render: ->
    div {className: "icon message"},
      i {className: "attention icon"}
      div {className: "content"},
        div {className: "header"}, "Page not found"
        p {}, "The page you tried to reach does not exist. Sorry about that."

module.exports = Dermis
