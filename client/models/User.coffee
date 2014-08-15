module.exports = ->

  Dermis = require "../vendor/dermis"

  Dermis.model
    idAttribute: "_id"
    name: "User"
    url: "/v1/users"
