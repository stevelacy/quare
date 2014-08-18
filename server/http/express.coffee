{join} = require "path"
express = require "express"
toobusy = require "toobusy"
compress = require "compression"
session = require "express-session"
sessionStore = require "./sessionStore"
csrf = require "csurf"

config = require "../../config"
log = require "../../lib/log"

toobusy.maxLag 400

app = express()
app.disable "x-powered-by"
app.use compress()
app.use express.static join __dirname, "../../public"

app.use session
  store: sessionStore
  name: config.session.name
  secret: config.session.secret
  cookie:
    maxAge: 3600000000

#app.use csrf()

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
