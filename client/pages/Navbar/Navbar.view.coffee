define (require) ->

  (route, ctx) ->

    {header, h1, img, a, div, span, p, button} = React.DOM
    Dermis = require 'vendor/dermis'

    app = require('vendor/dermis').app
    me  = require 'auth'

    Dermis.view
      gotoMap: ->
        console.log("Going to Map")
        page '/map'
        return false

      gotoProfile: ->
        console.log("Going to Profile")
        page '/profile'
        return false

      gotoChallenges: ->
        console.log("Going to Challenges")
        page '/challenges'
        return false

      render: ->
        if route.path is "/challenges"
          header {className: "bar bar-nav main-navbar"},
            a {href: "#", className: "icon pu-icon icon-profile pull-right", onClick: @gotoProfile}
            h1 {className: "title"}, "Pick A Challenge"
        else if (route.path is "/challenges/1")
          header {className: "bar bar-nav main-navbar"},
            a {href: "#", className: "icon pu-icon icon-back pull-left", onClick: @gotoChallenges}
            a {href: "#", className: "icon pu-icon icon-profile pull-right", onClick: @gotoProfile}
            h1 {className: "title"}, "Get A Bike"
        else if (route.path is "/profile")
          header {className: "bar bar-nav main-navbar"},
            a {href: "#", className: "icon pu-icon icon-back pull-left", onClick: @gotoChallenges}
            h1 {className: "title"}, "Me"
        else if (route.path is "/intro" || route.path is "/")
          header {className: "bar bar-nav main-navbar bar-nav-dark"}
        else
          header {className: "bar bar-nav main-navbar"},
            a {href: "#", className: "icon pu-icon icon-back pull-left", onClick: @gotoChallenges}
            h1 {className: "title"}, "Not Found"
