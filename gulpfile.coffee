path = require "path"
gulp = require "gulp"
gutil = require "gulp-util"

jade = require "gulp-jade"
csso = require "gulp-csso"
cache = require "gulp-cached"
jshint = require "gulp-jshint"
coffee = require "gulp-coffee"
stylus = require "gulp-stylus"
uglify = require "gulp-uglify"
concat = require "gulp-concat"
plumber = require "gulp-plumber"
reload = require "gulp-livereload"
htmlmin = require "gulp-minify-html"
coffeeify = require "gulp-coffeeify"

gif = require "gulp-if"
sourcemaps = require "gulp-sourcemaps"

nib = require "nib"
autoprefixer = require "autoprefixer-stylus"
autowatch = require "gulp-autowatch"

cssSupport = [
  "last 5 versions"
  "> 1%"
  "ie 8"
  "ie 7"
  "Android"
  "Android 4"
  "BlackBerry 10"
]

# paths
paths =
  vendor: "./client/vendor/**/*"
  img: "./client/img/**/*"
  fonts: "./client/fonts/**/*"
  coffee: "./client/**/*.coffee"
  coffeeSrc: "./client/start.coffee"
  stylus: "./client/**/*.styl"
  stylusSrc: "./client/css/app.styl"
  jade: "./client/**/*.jade"

gulp.task "server", (cb) ->
  require "./start"

# javascript
gulp.task "coffee", ->
  gulp.src paths.coffeeSrc
    .pipe plumber()
    .pipe gif gutil.env.production, uglify()
    .pipe coffeeify()
    .pipe gulp.dest "./public"
    .pipe reload()

# styles
gulp.task "stylus", ->
  gulp.src paths.stylusSrc
    .pipe sourcemaps.init()
    .pipe stylus
      use:[
        nib()
        autoprefixer cssSupport, cascade: true
      ]
    .pipe sourcemaps.write()
    .pipe concat "app.css"
    .pipe gif gutil.env.production, csso()
    .pipe gulp.dest "./public"
    .pipe reload()

gulp.task "jade", ->
  gulp.src paths.jade
    .pipe jade()
    .pipe cache "html"
    .pipe gif gutil.env.production, htmlmin()
    .pipe gulp.dest "./public"
    .pipe reload()

gulp.task "vendor", ->
  gulp.src paths.vendor
    .pipe cache "vendor"
    .pipe gulp.dest "./public/vendor"
    .pipe reload()

gulp.task "img", ->
  gulp.src paths.img
    .pipe cache "img"
    .pipe gulp.dest "./public/img"
    .pipe reload()

gulp.task "fonts", ->
  gulp.src paths.fonts
    .pipe cache "fonts"
    .pipe gulp.dest "./public/fonts"
    .pipe reload()

gulp.task "watch", ->
  autowatch gulp, paths


gulp.task "css", ["stylus"]
gulp.task "js", ["coffee"]
gulp.task "static", ["jade", "vendor", "img", "fonts"]
gulp.task "default", ["js", "css", "static", "server", "watch"]
