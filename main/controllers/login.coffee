exports.login = (req, res, next) -> res.render 'login'

exports.doLogin = (req, res, next) ->
  #ToDo user authentication
  #if pass
  #create session
  #add cookie with username in cookie
  res.redirect '/'
  #if not pass
  #res.status 400
