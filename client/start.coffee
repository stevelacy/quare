fission = require './app'

router = require './router'

router.start
  click: true
  dispatch: true
  popstate: true
