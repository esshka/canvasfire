gulp = require 'gulp'
connect = require 'gulp-connect'
coffee = require 'gulp-coffee'
uglify = require('gulp-uglify')

gulp.task 'connect', ->
  connect.server
    port: 1337
    livereload: on
    root: './dist'

gulp.task 'coffee', ->
  gulp.src 'coffee/*.coffee'
    .pipe do coffee
    .pipe gulp.dest 'lib'
    .pipe do connect.reload

gulp.task 'compress', ->
  gulp.src 'lib/*.js' 
    .pipe uglify() 
    .pipe gulp.dest 'dist/js'

gulp.task 'watch', ->
  gulp.watch 'coffee/*.coffee', ['coffee']

gulp.task 'default', ['coffee', 'compress', 'connect', 'watch']
