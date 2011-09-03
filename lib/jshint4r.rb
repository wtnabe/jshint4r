require 'execjs'

module JSHint4r
end

Dir.glob( File.dirname(__FILE__) + '/jshint4r/**/*.rb' ) { |f|
  require f
}
