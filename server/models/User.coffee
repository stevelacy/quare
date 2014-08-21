{Schema} = require "mongoose"


noWrite = ->
  perms =
    read: true
    write: false
  return perms

hidden = ->
  perms =
    read: false
    write: false
  return perms


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

  background:
    type: String
    default: "/img/use-background.png"

  firstLogin:
    type: Boolean
    default: true
    hidden: true

  provider:
    type: String
    hidden: true

  twid:
    type: Number

  token:
    type: String
    hidden: true

User.set "autoindex", false
module.exports = User
