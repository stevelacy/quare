Fission = require "../vendor/fission"

module.exports = Fission.model
  idAttribute: "_id"
  #name: "User"
  url: "http://node.la:5001/v1/users"
