express = require 'express'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
session = require 'express-session'
path = require 'path'


app = express()
module.exports.app = app

#app.use 'development', ->
app.set 'settings', require('./config/settings')('development')

#app.use 'production', ->
#  app.set 'settings', require('./config/settings')('production')
#  app.set 'view cache', true


app.use express.static path.join(__dirname, 'public')
app.set 'views', path.join(__dirname, '/main/views')
app.set 'view engine', 'jade'
app.engine 'jade', require('jade').__express

app.use bodyParser()
app.use cookieParser()
app.use session {secret: 'test'}

app.use (req, res, next) ->
  res.locals.current_user = req.session.user
  next()

app.get '/', (req, res, next) ->
  res.render 'layout'


app.listen app.get('settings').port, -> console.log 'Run in ' + app.get('settings').port
