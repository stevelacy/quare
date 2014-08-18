{Schema} = require "mongoose"

User = new Schema
  auth:
    type: Number
    required: true
    default: 0

  name:
    type: String

  handle:
    type: String
    required: true

  image:
    type: String
    default: "/images/user.png"

User.set "autoindex", false
module.exports = User
