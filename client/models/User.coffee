Fission = require "../vendor/fission"

module.exports = ->

  Fission.model
    idAttribute: "_id"
    name: "User"
    url: "/v1/users"
