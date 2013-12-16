framework = require('partial.js')
http = require('http')
os = require('os')

port = parseInt process.argv[2] or \8005
ip = process.argv[3] or \127.0.0.1




debug = if process.env.NODE_ENV is \production  then false else true

framework.run http, debug, port,ip

console.log 'http://{0}:{1}/'.format(framework.ip, framework.port), debug ? \debug :\release
