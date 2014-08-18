db = require "../../db"

User = db.models.User

module.exports = (req, res) ->

  User.find {}, (err, users) ->
    res.status(200).json users
