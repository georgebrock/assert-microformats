require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rubygems'
require 'echoe'

Echoe.new('assert-microformats', '0.1') do |p|
  p.description = 'A Rails plugin to help with testing the presence and correctness of microformats markup'
  p.url = 'http://github.com/georgebrock'
  p.author = 'George Brocklehurst'
  p.email = 'george.brocklehurst@gmail.com'
  p.ignore_pattern = []
  p.development_dependencies = []
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the assert_microformats plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the assert_microformats plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'AssertMicroformats'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
