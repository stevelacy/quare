define (require) ->

  {div, h1, button, br, span, img, p, b, header, a} = React.DOM
  Dermis = require 'vendor/dermis'
  ChallengeSquare = require 'components/ChallengeSquare/View'
  Challenge = require 'models/Challenge'

  Dermis.collectionView
    model: require 'models/Challenge'
    itemView: require 'components/ChallengeSquare/View'
    render: ->
      if @items is null or @items?.length <= 0
        @items = span {}, "No Matches right now!"

      div {},
        div {className: "user-bar"},
          span {className: "points"}, "280"
          span {className: "welcome"}, "Konichiwa Carson"
        div {className: "challenge-index-page"},
          @items
