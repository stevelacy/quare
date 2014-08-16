module.exports = ->

  Fission = require "../vendor/fission"

  Fission.model
    idAttribute: "_id"
    name: "Item"
    url: "/test.json"
