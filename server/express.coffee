{join} = require "path"
express = require "express"
toobusy = require "toobusy"
compress = require "compression"

config = require "../config"
log = require "../lib/log"

toobusy.maxLag 10

app = express()
app.disable "x-powered-by"
app.use compress()
app.use express.static join __dirname, "../public"

app.use (err, req, res, next) ->
  log.error err.stack
  res.status 500
    .send "Something broke!"
app.use (req, res, next) ->
  if toobusy()
    log.error "server busy"
    return res.status 503
      .send "Server under heavy load"
  next()

module.exports = app
