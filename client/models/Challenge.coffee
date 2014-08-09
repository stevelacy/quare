define (require) ->

  Dermis = require 'vendor/dermis'

  Dermis.model
    idAttribute: '_id'
    name: 'Challenge'
    url: "/test.json"
