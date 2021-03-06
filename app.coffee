axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
browserify   = require 'roots-browserify'
babelify     = require 'babelify'
records      = require 'roots-records'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    browserify(files: "assets/js/main.js", out: 'js/build.js', transform:  [babelify.configure({stage : 0 })]),
    css_pipeline(files: 'assets/css/*.styl'),
    records(
      projects: { file: 'data/projects.json' },
      contactList: { file: 'data/contact.json' }
    )
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
