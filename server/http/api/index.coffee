{join} = require "path"

app = require "../express"

user = require "./user"
users = require "./users"
items = require "./items"
item = require "./item"

conf =
  prefix: "/v1"

# User
app.get "#{conf.prefix}/users/:id", user.get
app.route "#{conf.prefix}/users"
.get users.get


app.get "#{conf.prefix}/items/:id", item.get
app.route "#{conf.prefix}/items"
.get items.get
.post items.post
