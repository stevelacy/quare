{app, middleware} = require "./vendor/dermis"

NotFoundView = require "./pages/NotFound/NotFound.view"
ProfileView = require "./pages/Profile/Profile.view"
NavbarView = require "./pages/Navbar/Navbar.view"
IndexView = require "./pages/Index/Index.view"
LoginView = require "./pages/Login/Login.view"

APPNAME = _serverConfig.name

#app.use middleware.clearFB
#app.use middleware.log

###
app.use
  view: NavbarView
  el: "navbar"
###

app.route "/login",
  title: "#{APPNAME} - Login"
  view: LoginView.view
  el: "content"
  continue: false

app.route "/profile",
  title: "#{APPNAME} - Profile"
  view: ProfileView.view
  el: "content"
  continue: false

app.route "/",
  title: "#{APPNAME}"
  view: IndexView.view
  el: "content"
  continue: false
###
app.use
  title: "#{APPNAME} - Not found"
  view: NotFoundView.view
  el: "content"
  continue: false
###
module.exports = app
