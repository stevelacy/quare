{router, middleware} = require "./vendor/fission"

NotFoundView = require "./pages/NotFound/NotFound.view"
ProfileView = require "./pages/Profile/Profile.view"
IndexView = require "./pages/Index/Index.view"
LoginView = require "./pages/Login/Login.view"

NavbarView = require "./components/Navbar/View"

APPNAME = _serverConfig.name


router.route "/login",
  title: "#{APPNAME} - Login"
  view: LoginView
  el: "content"
  continue: false

router.route "/:id",
  title: "#{APPNAME} - Profile"
  view: ProfileView
  el: "content"
  continue: false

router.route "/",
  title: "#{APPNAME} - Home"
  view: IndexView
  el: "content"
  continue: false

router.use
  title: "#{APPNAME} - Not found"
  view: NotFoundView
  el: "content"
  continue: false

module.exports = router
