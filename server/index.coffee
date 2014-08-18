{join} = require "path"

app = require "./http/express"
log = require "../lib/log"
config = require "../config"
httpServer = require "./http/httpServer"
# routes
api = require "./http/api"
spa = require "./http/spa"

# start api
api app
spa app

httpServer.listen config.port, ->
  log.info "info", "Server running on #{config.port}"
