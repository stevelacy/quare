Collection = require 'ampersand-collection'
underscoreMixin = require 'ampersand-collection-underscore-mixin'
Sync = require 'ampersand-collection-rest-mixin'

view = require './view'
ListenerMixin = require './ListenerMixin'

module.exports = (config) ->

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
      @items ?= []
      unless @collection?
        console.log @
        model = config.model
        unless model.sync?
          model.sync = Sync
        if model.isCollection
          ctor = Collection.extend model
        else
          conf =
            model: model
          inst = new model()
          conf.url = inst.url()
          ctor = Collection.extend underscoreMixin, model.sync, conf
        @collection = new ctor
        @collection.fetch
          success: (data) =>
            @renderItems()
          error: (err) =>
            console.log 'fetch error ', err

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
  return view config
