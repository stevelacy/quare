db = require "../../db"

User = db.models.User


module.exports.get = (req, res) ->

  if req.params.id?
    User.findOne {_id: req.params.id}, (err, user) ->
      res.status(200).json user

  else
    User.find {}, (err, users) ->

      res.status(200).json users
