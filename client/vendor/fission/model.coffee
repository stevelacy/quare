Model = require 'ampersand-model'

module.exports = (model) ->

  model.url ?= '/'
  model.urlRoot = model.url
  delete model.url

  m = Model.extend model

  #,
  #  modelType: model.name
  #m.prototype.getType = -> "model"

  return m
