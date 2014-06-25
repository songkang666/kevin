login = require '../controllers/login'
index = require '../controllers/index'
user = require '../controllers/user'

app = module.parent.exports.app

app.get '/', index.index
app.get '/index', index.index
app.get '/logout', index.logout
