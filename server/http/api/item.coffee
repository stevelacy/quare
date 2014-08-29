db = require "../../db"

Item = db.models.Item


module.exports.get = (req, res) ->

  Item.findOne {_id: req.params.id}, (err, users) ->

    res.status(200).json users
