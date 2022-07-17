var gulp = require('gulp'),
     uglify = require('gulp-uglify'),
     rename = require('gulp-rename'),
     concat = require('gulp-concat'),
     autoprefixer = require('gulp-autoprefixer'),
     sass = require('gulp-sass')(require('sass'));

function scripts() {
     return gulp.src([
          'src/js/**/*.js'
     ])
     .pipe(concat('scripts.js'))
     .pipe(rename( {suffix: '.min'} ))
     .pipe(uglify())
     .pipe(gulp.dest('dist/js/'));
}

function buildStyles() {
     return gulp.src([
          'src/sass/app.scss'
     ])
     .pipe(sass(
          { outputStyle: 'compressed' }
     ))//.on('error', sass.logError))
     .pipe(autoprefixer({
          cascade: false
     }))
     .pipe(rename({ suffix: '.min' }))
     .pipe(gulp.dest('dist/css/'));
}

function watchFiles() {
	gulp.watch(['src/js/**/*.js', 'src/sass/**/*.scss'], gulp.series(scripts, buildStyles));
}

gulp.task('scripts', scripts);
gulp.task('styles', buildStyles);
gulp.task('watch', watchFiles);

gulp.task('default', watchFiles)