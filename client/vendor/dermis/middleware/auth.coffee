auth = require '../../../auth'
module.exports = (ctx, next) ->

  return auth (me) ->
    if me?
      # TODO: uncomment after logout implemented
      #window.location.href = '/' if window.location.pathname is '/login'
      return next()
    else
      window.location.href = "/login" unless window.location.pathname is "/login"
      return next()
