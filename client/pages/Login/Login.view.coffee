define (require) ->

  {div, h1, button, br, span, img} = React.DOM
  Dermis = require 'vendor/dermis'
  firebase = require 'firebase'

  Dermis.view
    login: ->
      console.log firebase
      auth = new FirebaseSimpleLogin firebase, (error, user) ->

        # just doing this manually - we'll need another screen
        # to select auth type then trigger this with creds

        auth.login 'password', {email: 'aaron@wearefractal.com', password: 'test'}

        # redirect to homepage
        page '/'

    render: ->

      div {className: "login-page content-padded"},

        div {},
          img {src: '/img/ripple.png'}

        div {className: 'greytext'},
          div {}, "A daily challenge to"
          div {}, "change the world, together."

        br {}
        button {className: 'button', onClick: @login}, "LOGIN"
