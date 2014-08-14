module.exports = ->

  Dermis = require "../vendor/dermis"

  Dermis.model
    idAttribute: "_id"
    name: "Item"
    url: "/test.json"
