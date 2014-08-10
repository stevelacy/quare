bunyan = require 'bunyan'
config = require '../config'

serializers =
  req: (req) ->
    method: req.method
    url: req.url
    headers: req.headers
    body: req.body

module.exports = bunyan.createLogger
  name: config.name
  serializers:
    req: serializers.req
