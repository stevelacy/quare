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

# User
app.get "/v1/users/:id", user
app.get "/v1/users", users
