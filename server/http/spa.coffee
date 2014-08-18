{join} = require "path"

config = require "../../config"
app = require "./express"

# page.js - client-side config

app.get "/serverConfig.js", (req, res) ->
  src = "window._serverConfig = {"
  src += "name: '#{config.name}'"
  src += "};"

  res.set "Content-Type", "application/javascript"
  res.status 200
    .send src


app.get "/*", (req, res) ->
  idxFile = join __dirname, "../../public/index.html"
  res.sendFile idxFile
