Fission = require "../vendor/fission"


Model = Fission.model
  mainIndex: "_id"
  idAttribute: "_id"
  url: "/v1/items"
  props:
    _id: "string"
    name: "string"
    content: "string"
module.exports = Model
