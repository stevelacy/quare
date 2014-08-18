{Schema} = require "mongoose"

User = new Schema
  auth:
    type: Number
    default: 0

  name:
    type: String

  handle:
    type: String
    required: true

  image:
    type: String
    default: "/img/user.png"

  firstLogin:
    type: Boolean
    default: true

  provider:
    type: String

  twid:
    type: Number

  token:
    type: String

User.set "autoindex", false
module.exports = User
