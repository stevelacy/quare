define (require) ->

  {div, p, img, span} = React.DOM
  Dermis = require 'vendor/dermis'

  Dermis.modelView
    model: require 'models/Challenge'
    openChallenge: (a, b, c) ->
      console.log 'Going to challenge #', @model.get('id')
      page '/challenges/1' # @model.get('id')
    render: ->
      {id, title, icon, score, state} = @model.attributes

      div {className: 'challenge-square ' + state, key: id, onClick: @openChallenge},
        div {className: 'challenge-square-inner'},
          img {src: '/img/icons/' + icon}
          p {className: 'challenge-title'}, title
          p {className: 'impact-score'},
            span {}, score
