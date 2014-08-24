{join} = require "path"

app = require "../express"

user = require "./user"
users = require "./users"
items = require "./items"
item = require "./item"

# User
app.get "/v1/users/:id", user
app.get "/v1/users", users

app.get "/v1/items/:id", item
app.get "/v1/items", items
