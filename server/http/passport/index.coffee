db = require "../../db"
User = db.models.User
passport = require "passport"
config = require "../../../config"
app = require "../express"
clientAuth = require "./clientAuth"

app.use passport.initialize()
app.use passport.session()

app.get "/logout", (req, res) ->
  req.logout()
  res.redirect "/"


app.get "/auth.js", (req, res) ->
  src = clientAuth req.user
  res.set "Content-Type", "application/javascript"
  res.status(200).send src

module.exports = passport
