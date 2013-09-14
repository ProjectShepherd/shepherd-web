
module.exports = (grunt) ->

    grunt.initConfig
        pkg: grunt.file.readJSON('package.json')

        clean:
            src:
                ['generated']

        coffee:
            compile:
                files:        
                    'generated/<%= pkg.name %>.js': [
                        'coffee/**/*.coffee'
                    ]

        ngmin:
            compile:
                files:
                    'generated/<%= pkg.name %>.jsmin.js': [
                        'generated<%= pkg.name %>.js'
                    ]

        uglify:
            compile:
                files:
                    'generated/<%= pkg.name %>.min.js': [
                        'generated/<%= pkg.name %>.jsmin.js'
                    ]

        sass:
            deploy:
                src:    ['styles/style.scss']
                dest:   'styles/style.min.css'

        watch:
            compile:
                files:
                    ['styles/**.scss', 'coffee/**/*.coffee']
                tasks:
                    ['default']
                options:
                    livereload: true

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-ngmin'

    grunt.registerTask 'default', ['build', 'clean']
    grunt.registerTask 'build', ['coffee', 'ngmin', 'uglify', 'sass']
