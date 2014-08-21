{join} = require "path"

app = require "./http/express"
log = require "../lib/log"
config = require "../config"
httpServer = require "./http/httpServer"

# authentication
auth = require "./http/passport"
fbauth = require "./http/passport/twitter"

# routes
api = require "./http/api"
spa = require "./http/spa"


httpServer.listen config.port, ->
  log.info "info", "Server running on #{config.port}"
