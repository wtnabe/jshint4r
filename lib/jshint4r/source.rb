module JSHint4r
  class Source
    JSHINT = File.dirname(__FILE__) + '/../../vendor/jshint/jshint.js'
    RUNNER = File.dirname(__FILE__) + '/jshint_runner.js'

    class << self
      #
      # [return] String
      #
      def src
        [JSHINT, RUNNER].map { |f| open(f).read }.join
      end

      #
      # [return] ExecJS::*::Context
      #
      def context
        if ( !@context )
          @context = ExecJS.compile( src )
        end

        @context
      end
    end
  end
end
