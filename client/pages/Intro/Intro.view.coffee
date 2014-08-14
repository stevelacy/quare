{div, h1, h2, button, br, span, img, i, p, strong} = React.DOM
Dermis = require "../../vendor/dermis"

Dermis.view
  goChallenges: ->
    page "/challenges"

  render: ->

    div {className: "intro-page"},
      div {className: "slider", id: "introSlider"},
        div {className: "slide-group"},
          div {className: "slide"},
            div {className: ""},
              i {className: "icon pu-icon icon-speech"}
              h2 {}, "Get Informed"
              p {}, "What can ", strong({}, "you"), " do about climate change?"

          div {className: "slide"},
            div {className: ""},
              i {className: "icon pu-icon icon-flag"}
              h2 {}, "Take Action"
              p {}, "Do ", strong({}, "simple actions"), " that add up to big change for the planet."

          div {className: "slide"},
            div {className: ""},
              i {className: "icon pu-icon icon-check"}
              h2 {}, "Take Action"
              p {}, strong({}, "Earn badges"), " for your awesome new habits."
              div {className: "actions"},
                span {className: "btn btn-primary btn-block", onClick: @goChallenges}, "Get Started"

module.exports = Dermis
