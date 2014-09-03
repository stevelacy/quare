db = require "../../db"

Item = db.models.Item


module.exports =
  get: (req, res) ->
    if req.params.id?
      Item.findOne {_id: req.params.id}, (err, item) ->
        res.status(200).json item
    else
      Item.find {}, (err, users) ->

        res.status(200).json users

  post: (req, res) ->
    if req.body && typeof req.body == 'object'
      content = req.body
      item = new Item content
      item.save (err, data) ->
        return res.status(500).send error: "item not created" if err?
        return res.status(200).send status: data
    else
      return res.status(500).send error: "incorrect type"
  del: (req, res) ->
    res.status(200).send 'OK'
    console.log req.body
