{join} = require "path"

app = require "./express"
log = require "../lib/log"
config = require "../config"
httpServer = require "./httpServer"

idxFile = join __dirname, "../public/index.html"

# page.js - client-side routing

app.get "/serverConfig.js", (req, res) ->
  src = "window._serverConfig = {"
  src += "name: '#{config.name}'"
  src += "};"

  res.set "Content-Type", "application/javascript"
  res.status 200
    .send src

####
# TESTING REMOVE

app.get "/test.json", (req, res) ->
  testFile = join __dirname, "../client/test.json"
  res.sendFile testFile

app.get "/v1/users", (req, res) ->
  testFile = join __dirname, "../client/users.json"
  res.sendFile testFile

app.get "/v1/user", (req, res) ->
  testFile = join __dirname, "../client/user.json"
  res.sendFile testFile
####


app.get "/*", (req, res) ->
  res.sendFile idxFile

httpServer.listen config.port, ->
  log.info "info", "Server running on #{config.port}"
