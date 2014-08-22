db = require "../../db"

Item = db.models.Item


module.exports = (req, res) ->

  Item.find {}, (err, users) ->

    res.status(200).json users
