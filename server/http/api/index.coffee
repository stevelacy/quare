{join} = require "path"
requireDir = require "require-dir"

app = require "../express"

routes = requireDir()

conf =
  prefix: "/v1"

for route of routes
  if routes[route].get
    app.get "#{conf.prefix}/#{route}/:id", routes[route].get
    app.get "#{conf.prefix}/#{route}", routes[route].get
  if routes[route].post
    app.post "#{conf.prefix}/#{route}/:id", routes[route].post
    app.post "#{conf.prefix}/#{route}", routes[route].post
  if routes[route].del
    app.del "#{conf.prefix}/#{route}/:id", routes[route].del
    app.del "#{conf.prefix}/#{route}", routes[route].del
