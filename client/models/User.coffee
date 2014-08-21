Fission = require "../vendor/fission"

module.exports = Fission.model
  idAttribute: "_id"
  #name: "User"
  url: ->
    console.log @
    if @get 'handle'
      return "#{@url}?handle=#{@get 'handle'}"
    return "/v1/users"
