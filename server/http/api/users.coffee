db = require "../../db"

User = db.models.User


module.exports.get = (req, res) ->

  User.find {}, (err, users) ->

    res.status(200).json users
