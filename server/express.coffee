{join} = require 'path'
express = require 'express'
toobusy = require 'toobusy'
compress = require 'compression'

config = require '../config'
log = require '../lib/log'

toobusy.maxLag 400

app = express()
app.disable 'x-powered-by'
app.use compress()
app.use express.static join __dirname, '../public'

app.all '*', (req, res, next) ->
  return next() unless req.get 'Origin'
  res.set 'Access-Control-Allow-Origin', '*'
  res.set 'Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE'
  res.set 'Access-Control-Allow-Headers', 'X-Requested-With, Content-Type'
  return res.send 200 if 'OPTIONS' is req.method
  next()

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
