db = require "../../db"

User = db.models.User

module.exports = (req, res) ->

  User.findOne {_id: req.params.id}, (err, user) ->
    res.status(200).json user
