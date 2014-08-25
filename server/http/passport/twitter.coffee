passport = require "passport"
{Strategy} = require "passport-twitter"
db = require "../../db"
User = db.models.User

config = require "../../../config"
app = require "../express"
express = require "express"

# cherry pick fields of twitter json to make a user profile
profileToUser = (profile, accessToken) ->
  create =
    name: profile.name
    twid: profile.id
    provider: "twitter"
    token: accessToken
    handle: profile.screen_name
    image: profile.profile_image_url_https.replace '_normal', ''
    background: "#{profile.profile_banner_url}/1500x500"

  console.log create
  return create

# main login handler
handleLogin = (accessToken, refreshToken, profile, done) ->
  theoreticalUser = profileToUser profile._json, accessToken

  q = User.findOne twid: theoreticalUser.twid
  q.exec (err, user) ->
    return done err if err?
    if user?
      handleExistingLogin user, theoreticalUser, done
    else
      handleFirstLogin theoreticalUser, done

# login handler for users who have logged in before
handleExistingLogin = (user, theoreticalUser, cb) ->
  user.set theoreticalUser
  user.set "firstLogin", false
  user.save cb

# login handler for users who have never logged in
handleFirstLogin = (theoreticalUser, cb) ->
  User.create theoreticalUser, cb

# serializing used for signed cookies
userToString = (user, cb) ->
  cb null, String user._id

stringToUser = (_id, cb) ->
  User.findById _id, cb

# internals to twitter login
strategyConfig =
  consumerKey: config.twitter.id
  consumerSecret: config.twitter.secret
  callbackURL: config.twitter.callback

strategy = new Strategy strategyConfig, handleLogin

passport.use strategy
passport.serializeUser userToString
passport.deserializeUser stringToUser

app.get "/auth/twitter", passport.authenticate "twitter"

app.get "/auth/twitter/callback", passport.authenticate "twitter",
  successRedirect: "/"
  failureRedirect: "/login"
  failureFlash: true

module.exports = passport
