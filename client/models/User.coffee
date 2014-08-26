Fission = require "../vendor/fission"


Model = Fission.model
  url: "/v1/users"
  props:
    auth: "number"
    handle: "string"
    name: "string"
    image: "string"
    background: "string"
module.exports = Model
