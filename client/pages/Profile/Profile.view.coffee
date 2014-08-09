define (require) ->

  {div, h2, h3, img, p, span, a} = React.DOM
  Dermis = require 'vendor/dermis'

  Dermis.view
    render: ->

      div {className: "profile-page"},

        div {className: "block user-details"},
          div {className: "user-photo"},
            img {src: "/img/demo/user-1.jpg"}
          div {className: "user-info"},
            div {className: "padder"},
              h3 {}, "Carson Linforth Bowley"
              p {className: "location"}, "San Francisco"
              p {className: "impact-score"},
                span {}, "280"

        div {className: "block my-footprint"},
          a {className: "action-link", href: "#"}, "Edit"
          h2 {}, "My Footprint"

        div {className: "block achievements"},
          h2 {}, "Achievements"

        div {className: "block saved-for-later"},
          h2 {}, "Saved For Later"
