login = require '../controllers/login'
app = module.parent.exports.app

app.get '/login', login.login

app.post '/login', login.doLogin
