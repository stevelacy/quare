Fission = require "../vendor/fission"


Model = Fission.model
  mainIndex: "_id"
  url: "/v1/items"
  props:
    name: "string"
    content: "string"
module.exports = Model
