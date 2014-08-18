module.exports = (user) ->
  src = ""
  if user?
    src += "window._user = {"
    src += "handle: '#{user.handle}',"
    src += "name: '#{user.name}',"
    src += "twid: '#{user.twid}',"
    src += "image: '#{user.image}'"
    src += "};"
  else
    src += "window._user = null;"
  return src
