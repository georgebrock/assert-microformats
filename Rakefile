require 'rake/testtask'
require 'rake/rdoctask'
require "rake/gempackagetask"
require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name              = "assert-microformats"
  s.version           = "0.1.1"
  s.summary           = "A Rails plugin to help with testing the presence and correctness of microformats markup"
  s.author            = "George Brocklehurst"
  s.email             = "george.brocklehurst@gmail.com"
  s.homepage          = "http://github.com/georgebrock"
  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.markdown)
  s.rdoc_options      = %w(--main README.markdown)
  s.files             = %w(MIT-LICENSE README.markdown Rakefile) + Dir.glob("{test,lib,rails}/**/*")
  s.require_paths     = ["lib"]
  s.add_dependency("mofo", ">= 0.2.0")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the assert-microformats plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the assert-microformats plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'AssertMicroformats'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
