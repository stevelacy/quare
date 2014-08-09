define (require) ->

  app = require './dermis/dermis-app'

  ListenerMixin =
    listenTo: (ee, event, listener) ->
      ee.on event, listener
      return this

    removeListener: (ee, event, listener) ->
      if ee.off?
        ee.off event, listener
      else if ee.removeListener
        ee.removeListener event, listener
      return this

    componentWillMount: ->
      @listeners = []
      return

    componentWillUnmount: ->
      for l in @listeners
        @removeListener l.ee, l.event, l.listener
      return

  ModelViewMixin =
    mixins: [ListenerMixin]
    componentWillMount: ->
      # item view
      if @props.model?
        @model = @props.model
      # model instance view
      else if @props.params.id?
        @model = new @modelConstructor
          id: @props.params.id
        @listenTo @model, 'change', @forceUpdate
        @model.fetch()

  me = require 'auth'

  dermis =

    app: app

    middleware:
      auth:    'vendor/dermis/middleware/auth'
      clearFB: 'vendor/dermis/middleware/clearFB'
      log:     'vendor/dermis/middleware/log'

    mixins:
      Listener: ListenerMixin

    view: (config) ->
      return React.createClass dermis.alias config

    modelView: (config) ->
      # valid the options given
      unless config.model?
        throw new Error 'Missing model attribute'

      config.mixins ?= []
      config.mixins.push ModelViewMixin
      return dermis.view config

    collectionView: (config) ->

      CollectionViewMixin =
        mixins: [ListenerMixin]
        renderItems: ->
          if @itemView?
            @items = @collection.map (m) =>
              return @itemView
                model: m
                key: m.id
          @forceUpdate()
        componentWillMount: ->
          unless @collection?
            ctor = dermis.collection config.model
            @collection = new ctor
            @collection.fetch success: =>
              @renderItems()

              @listenTo @collection, 'add change remove', (e) =>
                @renderItems()
          else
            # TODO: check if collection is an
            # instance of a constructor
            # construct and call fetch if constructor
            @renderItems()

      # valid the options given
      unless @collection? or @model?
        throw new Error 'Requires either collection or model attribute'

      config.mixins ?= []
      config.mixins.push CollectionViewMixin
      return dermis.view config

    alias: (config) ->
      aliases =
        init: 'getInitialState'
        mounting: 'componentWillMount'
        mounted: 'componentDidMount'
        unmounting: 'componentWillUnmount'

      # for each alias when the config has the alias fn
      # point the original fn to the alias fn defined
      for k, v of aliases when config[k]?
        config[v] ?= config[k]

      config.mixins ?= []
      return config

    collection: (model) ->

      # create collection from a model
      if model.prototype.getType() is 'model'
        inst = new model
        if !(inst instanceof Backbone.Model)
          throw new Error "dermis#collection: Model provided not a Backbone Model"
        col = Backbone.Collection.extend
          model: model
          url: inst.urlRoot

      # just a collection wrapper
      else if model instanceof Backbone.Collection
        col = Backbone.Collection.extend model

      else
        throw new Error "dermis#collection: Model or Collection specified invalid: #{model}"

      return col

    model: (model) ->
      model.urlRoot = model.url
      delete model.url
      m = Backbone.Model.extend model,
        modelType: model.name
      m.prototype.getType = -> "model"
      return m

  return dermis
