module.exports = (grunt) ->
  grunt.initConfig {
    watch:
      server : 
        files:["src/srv/*.ls","src/srv/*/*.ls","src/srv/*/*/*.ls"]
        tasks:["livescript:server"]
      client : 
        files:["src/client/javascripts/*.ls","src/client/javascripts/*/*.ls","src/client/javascripts/*/*/*.ls"]
        tasks:["livescript:client"]
      css : 
        files:[
               "src/client/stylesheets/sass/*.sass",
               "src/client/stylesheets/sass/*/*.sass",
               "src/client/stylesheets/sass/*.scss"
               "src/client/stylesheets/sass/*/*.scss",
              ]
        tasks:["sass:dist"]
    bowerful : 
      pack:
        store: './src/client/modules/'
        dest: './src/client/modules/'
        

          
    sass:
      dist:
        options:
          compass: true
          noCache: true
        files:[
          expand:true
          cwd:'./src/client/stylesheets/sass/'
          src:['slidenow.sass']
          dest:'./public/stylesheets/'
          ext:'.css'
          compass:true
        ]
    livescript:
      server :
        expand:true
        cwd:"./src/srv/javascripts"
        src:["*/*/*.ls","*/*.ls","*.ls"]
        dest:"./"
        ext:".js"
      client :
        expand:true
        cwd:"./src/client/javascripts"
        src:["*/*/*.ls","*/*.ls","*.ls"]
        dest:"./public/javascripts"
        ext:".js"
  }
  grunt.loadNpmTasks('grunt-bowerful');
  grunt.loadNpmTasks('grunt-livescript');
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.registerTask('default', ['livescript','sass','watch'])
  grunt.registerTask('gen', ['livescript','sass'])
