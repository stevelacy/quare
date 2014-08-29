{join} = require "path"

app = require "../express"

user = require "./user"
users = require "./users"
items = require "./items"
item = require "./item"

# User
app.get "/v1/users/:id", user.get
app.route "/v1/users"
.get users.get


app.get "/v1/items/:id", item.get
app.route "/v1/items"
.get items.get
.post items.post
