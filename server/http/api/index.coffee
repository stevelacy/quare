{join} = require "path"

app = require "../express"

user = require "./user"
users = require "./users"



app.all "*", (req, res, next) ->
  res.header "Access-Control-Allow-Origin", req.headers.origin
  res.header "Access-Control-Allow-Credentials", true
  res.header "Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS"
  res.header "Access-Control-Allow-Headers", "X-Requested-With, Content-Type, Authorization, Content-Length"
  return res.send(200)  if req.method is "OPTIONS"
  next()


####
# TESTING REMOVE

app.get "/test.json", (req, res) ->
  testFile = join __dirname, "../../../client/test.json"
  res.sendFile testFile

app.get "/v1/users/:id", user
app.get "/v1/users", users

#    testFile = join(__dirname, "../../../client/users.json")
#    res.status(200).sendFile testFile

app.get "/v1/user", (req, res) ->
  testFile = join __dirname, "../../../client/user.json"
  res.sendFile testFile
####
