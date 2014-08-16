module.exports = ->

  Fission = require "../vendor/fission"

  Fission.model
    idAttribute: "_id"
    name: "User"
    url: "/v1/users"
