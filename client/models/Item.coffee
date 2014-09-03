fission = require "../app"


Model = fission.model
  idAttribute: "_id"
  url: "/v1/items"
  props:
    _id: "string"
    name: "string"
    content: "string"
module.exports = Model
