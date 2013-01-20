# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
Dir.glob( File.dirname(__FILE__) + '/lib/tasks/*.rake' ) { |f|
  load f
}

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "jshint4r"
  gem.homepage = "http://github.com/wtnabe/jshint4r"
  gem.license = "MIT"
  gem.summary = %Q{jshint4r}
  gem.description = %Q{jshint runner for ruby}
  gem.email = "wtnabe@gmail.com"
  gem.authors = ["wtnabe"]
  gem.files.include Dir.glob('vendor/jshint/*')
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new('spec:coverage') do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  if RUBY_VERSION < '1.9'
    spec.rcov = true
  else
    ENV['COVERAGE'] = 'true'
  end
end

task :default => :spec

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jshint4r #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
