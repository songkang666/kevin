exports.index = (req, res, next) ->
  #ToDo add cookie authentication module
  #if pass
  res.render 'index'
  #if not pass
  #res.redirect '/login'

exports.logout = (req, res, next) ->
  #ToDo abolish session
  res.redirect '/login'
