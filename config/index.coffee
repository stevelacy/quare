keys = require "./keys"

module.exports =
  port: 5000
  name: "Quare"
  mongo:
    url: "mongodb://127.0.0.1:27017/quare"
    host: "127.0.0.1"
    port: 27017
    name: "quare"
  twitter:
    id: keys.twitter.id
    secret: twitter.secret
    callback: "/auth/twitter/callback"
  session:
    name: "saywat.sid"
    secret: keys.session.secret
