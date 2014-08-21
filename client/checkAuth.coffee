module.exports = ->
  return if window._user?
  window.location = "/login"
