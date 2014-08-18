{join} = require "path"

module.exports = (app) ->

  ####
  # TESTING REMOVE

  app.get "/test.json", (req, res) ->
    testFile = join __dirname, "../../../client/test.json"
    res.sendFile testFile

  app.get "/v1/users", (req, res) ->

    testFile = join(__dirname, "../../../client/users.json")
    res.status(200).sendFile testFile

  app.get "/v1/user", (req, res) ->
    testFile = join __dirname, "../../../client/user.json"
    res.sendFile testFile
  ####
