# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jshint4r"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["wtnabe"]
  s.date = "2013-01-24"
  s.description = "jshint runner for ruby"
  s.email = "wtnabe@gmail.com"
  s.executables = ["jshint4r"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".gitmodules",
    ".rspec",
    ".travis.yml",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/jshint4r",
    "jshint4r.gemspec",
    "lib/jshint4r.rb",
    "lib/jshint4r/cli.rb",
    "lib/jshint4r/config.rb",
    "lib/jshint4r/jshint_runner.js",
    "lib/jshint4r/linter.rb",
    "lib/jshint4r/reporter.rb",
    "lib/jshint4r/reporter/compilation.rb",
    "lib/jshint4r/reporter/text.rb",
    "lib/jshint4r/result.rb",
    "lib/jshint4r/source.rb",
    "lib/jshint4r/target.rb",
    "lib/tasks/git-untracked.rake",
    "spec/fixtures/config.yml",
    "spec/fixtures/missing_semicolon.js",
    "spec/fixtures/no_errors.js",
    "spec/jshint4r/config_spec.rb",
    "spec/jshint4r/linter_spec.rb",
    "spec/jshint4r/reporter/compilcation_spec.rb",
    "spec/jshint4r/reporter/text_spec.rb",
    "spec/jshint4r/reporter_spec.rb",
    "spec/jshint4r/result_spec.rb",
    "spec/jshint4r/source_spec.rb",
    "spec/jshint4r/target_spec.rb",
    "spec/jshint4r_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/sample_error.rb",
    "vendor/jshint/CHANGELOG",
    "vendor/jshint/Makefile",
    "vendor/jshint/README.md",
    "vendor/jshint/jshint.js"
  ]
  s.homepage = "http://github.com/wtnabe/jshint4r"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "jshint4r"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<execjs>, [">= 0"])
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
    else
      s.add_dependency(%q<execjs>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<execjs>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
  end
end

