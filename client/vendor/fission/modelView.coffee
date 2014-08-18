ListenerMixin = require './ListenerMixin'
view = require './view'

module.exports = (config) ->

  ModelViewMixin =
    mixins: [ListenerMixin]
    componentWillMount: ->
      # item view
      if @props.model?
        @model = @props.model
      # model instance view
      else if @props.params?.id?
        @model = new config.model
        @model.set(@model.idAttribute, @props.params.id)
        @listenTo @model, 'change', =>
          @forceUpdate()
        @model.fetch
          success: (data) ->
            console.log "success", data
          error: (data) ->
            console.log "error", data

  # validate the options given
  unless config.model?
    throw new Error 'Missing model attribute'

  config.mixins ?= []
  config.mixins.push ModelViewMixin
  return view config
