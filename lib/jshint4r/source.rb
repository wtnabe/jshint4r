module JSHint4r
  class Source
    JSHINT = File.dirname(__FILE__) + '/../../vendor/jshint/jshint.js'
    RUNNER = File.dirname(__FILE__) + '/jshint_runner.js'

    class << self
      #
      # [return] String
      #
      def src
        if ( !@src )
          @src = [JSHINT, RUNNER].map { |f| open(f).read }.join
        end

        @src
      end
    end
  end
end
