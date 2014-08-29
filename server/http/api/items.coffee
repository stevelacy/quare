db = require "../../db"

Item = db.models.Item


module.exports =
  get: (req, res) ->

    Item.find {}, (err, users) ->

      res.status(200).json users
  post: (req, res) ->
    if req.body && typeof req.body == 'object'
      content = req.body
      item = new Item content
      item.save (err, data) ->
        return res.status(500).send error: "error" if err?
        return res.status(200).send status: data
    else
      return res.status(500).send error: "incorrect type"
