{Schema} = require "mongoose"


Item = new Schema

  name:
    type: String

  content:
    type: String


Item.set "autoindex", false
module.exports = Item
