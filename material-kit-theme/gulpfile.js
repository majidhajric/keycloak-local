const gulp = require('gulp');
const path = require('path');
const sass = require('gulp-sass')(require('sass'));
const cleanCss = require('gulp-clean-css');
const runSequence = require('gulp4-run-sequence');
const del = require('del');
const flatten = require('gulp-flatten');
const wait = require('gulp-wait');
const autoprefixer = require('gulp-autoprefixer');
const sourcemaps = require('gulp-sourcemaps');
const open = require('gulp-open');


const paths = {
  dist: {
    base: 'theme/dist',
    img:  'theme/dist/assets/img',
    libs: 'theme/dist/assets/vendor'
  },
  base: {
    base: './',
    node: 'node_modules'
  },
  src: {
    css:  './theme/login/resources/css/',
    img:  './theme/login/resources/img/*.+(png|jpg|gif|svg)',
    js:   './theme/login/resources/js/**/*.js',
    scss: './theme/**/*.scss'
  }
}


gulp.task('watch', function() {
  gulp.watch(paths.src.scss, gulp.series('scss'));
});

//----------------
// Compile SCSS
function getFileName(file) {
  // Check if file extension is '.js'
  return file.name;
}

gulp.task('scss', async function() {
  return gulp.src(paths.src.scss)
      .pipe(wait(500))
      .pipe(sass().on('error', sass.logError))
     // .pipe(postcss([require('postcss-flexbugs-fixes')]))
      .pipe(autoprefixer({
        Browserslist: {
        }
      }))
      .pipe(gulp.dest(function (file) {
        return file.base;
      }))
      .pipe(flatten())
      .pipe(gulp.dest(paths.src.css));
});

// Minify CSS

gulp.task('minify:css', async function() {
  return gulp.src([
    paths.src.css + '/style.css'
  ])
      .pipe(cleanCss())
      .pipe(rename({ suffix: '.min' }))
      .pipe(gulp.dest(paths.dist.base + '/css'))
});
// Clean

gulp.task('clean:dist', async function() {
  return del.sync(paths.dist.base);
});

// Copy CSS

gulp.task('copy:css', async function() {
  return gulp.src([
    paths.src.base + 'assets/css/style.css'
  ])
      .pipe(gulp.dest(paths.dist.base + '/css'))
});
// Copy JS

gulp.task('copy:js', async function() {
  return gulp.src([
    paths.src.base + '/assets/js/main.js'
  ])
      .pipe(gulp.dest(paths.dist.base + '/js'))
});

// Build

gulp.task('build', async function(callback) {
  runSequence('clean:dist', 'scss', 'copy:css', 'copy:js',
      callback);
});

// Default

gulp.task('default', async function(callback) {
  runSequence(['clean:dist', 'build', 'watch'],
      callback
  )
});
