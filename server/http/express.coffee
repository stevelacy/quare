{join} = require "path"
express = require "express"
toobusy = require "toobusy"
compress = require "compression"
session = require "express-session"
bodyParser = require "body-parser"
sessionStore = require "./sessionStore"
csrf = require "csurf"

config = require "../../config"
log = require "../../lib/log"

toobusy.maxLag 400

app = express()
app.disable "x-powered-by"
app.use compress()
app.use express.static join __dirname, "../../public"

app.use bodyParser.urlencoded extended: true
app.use bodyParser.json()

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


app.all "*", (req, res, next) ->
  res.header "Access-Control-Allow-Origin", req.headers.origin
  res.header "Access-Control-Allow-Credentials", true
  res.header "Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS"
  res.header "Access-Control-Allow-Headers", "X-Requested-With, Content-Type, Authorization, Content-Length"
  return res.send(200)  if req.method is "OPTIONS"
  next()



module.exports = app
