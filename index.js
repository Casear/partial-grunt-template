(function(){
  var framework, http, os, port, ip, debug;
  framework = require('partial.js');
  http = require('http');
  os = require('os');
  port = parseInt(process.argv[2]) || '8005';
  ip = process.argv[3] || '127.0.0.1';
  debug = process.env.NODE_ENV === 'production' ? false : true;
  framework.run(http, debug, port, ip);
  console.log('http://{0}:{1}/'.format(framework.ip, framework.port), debug != null
    ? debug
    : {
      'debug': 'release'
    });
}).call(this);
