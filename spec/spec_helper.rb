$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'jshint4r'
require 'simplecov' if RUBY_VERSION >= '1.9'

if defined? SimpleCov and ENV['COVERAGE']
  SimpleCov.start do
    add_filter '/vendor/'
  end
end

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end

def fixture( name )
  File.join( File.dirname(__FILE__), 'fixtures', name )
end
