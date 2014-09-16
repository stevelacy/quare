ListenerMixin = require './ListenerMixin'
view = require './view'

module.exports = (config) ->
  console.log config

  ModelViewMixin =
    mixins: [ListenerMixin]
    componentWillMount: ->
      # item view
      # model instance view
      if config.id?
        @model = new config.model
        @model.id = config.id
        @listenTo @model, 'change', =>
          @forceUpdate()
        @model.fetch()
        console.log @model
      else if config.model?
        @model = config.model


  config.mixins ?= []
  config.mixins.push ModelViewMixin
  return view config
