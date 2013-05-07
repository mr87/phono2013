system "compass compile --css-dir=../wp.phono.local/wp-content/themes/phono2013/stylesheets --output-style compressed --force"

require 'closure-compiler'

jquery = Closure::Compiler.new(:compilation_level => 'SIMPLE_OPTIMIZATIONS').compile(File.open('javascripts/vendor/jquery.js', 'r'))

foundation = Closure::Compiler.new(:compilation_level => 'SIMPLE_OPTIMIZATIONS').compile_files([
	'javascripts/foundation/foundation.js',
	'javascripts/foundation/foundation.alerts.js',
	'javascripts/foundation/foundation.clearing.js',
	'javascripts/foundation/foundation.cookie.js',
	'javascripts/foundation/foundation.dropdown.js',
	'javascripts/foundation/foundation.forms.js',
	'javascripts/foundation/foundation.joyride.js',
	'javascripts/foundation/foundation.magellan.js',
	'javascripts/foundation/foundation.orbit.js',
	'javascripts/foundation/foundation.placeholder.js',
	'javascripts/foundation/foundation.reveal.js',
	'javascripts/foundation/foundation.section.js',
	'javascripts/foundation/foundation.tooltips.js',
	'javascripts/foundation/foundation.topbar.js'
])

app = Closure::Compiler.new(:compilation_level => 'SIMPLE_OPTIMIZATIONS').compile(File.open('javascripts/main.js', 'r'))

contents = jquery + foundation + app

filename = "../wp.phono.local/wp-content/themes/phono2013/javascripts/app.js"
File.open filename, "w" do |f|
  f.write contents
end