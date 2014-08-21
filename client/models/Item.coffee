Fission = require "../vendor/fission"

module.exports = ->

  Fission.model
    idAttribute: "_id"
    name: "Item"
    url: "/test.json"
