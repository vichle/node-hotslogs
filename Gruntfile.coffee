module.exports = (grunt) ->
  grunt.initConfig
    coffeelint:
      app: ['src/*.coffee', 'test/*.coffee']
      options:
        configFile: 'coffeelint.json'
    coffee:
      compile:
        files:
          'lib/index.js': ['src/*.coffee']
    mochaTest:
      options:
        reporter: 'nyan'
      src: ['test/test.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.registerTask 'default', ['coffee', 'mochaTest']
