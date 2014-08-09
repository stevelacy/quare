define (require) ->

  {div,h1,h2,h3,h4,hr,header,span,b} = React.DOM
  Dermis = require 'vendor/dermis'
  me = require 'auth'

  Dermis.view
    render: ->
      div {clasName: 'wave-page content'},
        div {className: 'bar bar-nav'},
          h1 {className: 'title'}, "Today's Wave"

        div {className: 'content wave-heading'},
          div {className: 'wave-content'},
            h1 {}, "Ride a bike"
            h4 {}, "Go human-powered for the day"

            div {className: 'actions'}, "Share a photo | Invite Friends | Share a tip"

            div {className: 'info'},
              h3 {}, "Did you know?"
              div {}, "More people commute by bicycle in Copenhagen than cycle to work in the entire United States"

            div {},
              h3 {}, "Did you know?"
              div {}, "More people commute by bicycle in Copenhagen than cycle to work in the entire United States"
