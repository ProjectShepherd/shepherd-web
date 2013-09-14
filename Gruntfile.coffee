
module.exports = (grunt) ->

    grunt.initConfig
        pkg: grunt.file.readJSON('package.json')

        clean:
            src:
                ['generated']

        concat:
            js:
                src:    ['js/**/*.js']
                dest:   'generated/app.js'

        ngmin:
            deploy:
                src:    ['generated/app.js']
                dest:   'generated/app.ngmin.js'
            dev:
                src:    ['generated/app.js']
                dest:   'jsmin/app.js'

        uglify:
            deploy:
                src:    'generated/app.ngmin.js'
                dest:   'jsmin/<%= pkg.name %>.min.js'

        sass:
            deploy:
                src:    ['styles/style.scss']
                dest:   'styles/style.min.css'

        watch:
            sass:
                files:
                    ['styles/**.scss']
                tasks:
                    ['sass']
                options:
                    livereload: true

            scripts:
                files:
                    ['js/**/*.js']
                tasks:
                    ['default']
                options:
                    livereload: true

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-ngmin'

    grunt.registerTask 'style', ['sass']
    grunt.registerTask 'default', ['build', 'clean']
    grunt.registerTask 'build', ['concat', 'ngmin', 'uglify', 'sass']
    grunt.registerTask 'noSass', ['concat', 'ngmin', 'uglify']
