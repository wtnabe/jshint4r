module JSHint4r
  module Reporter
    #
    # like output of npm's jshint
    #
    class Text
      include Reporter

      #
      # [param]  String target
      # [param]  Array  errors
      # [return] String
      #
      def report( target, errors, verbose = false )
        if errors
          errors.map { |error|
            e = key_symbolize( error )
            sprintf( "%s: line %s, col %s, %s",
              target, e[:line], e[:character], e[:reason] )
          }.join("\n") + <<EOD


#{errors.size} errors
EOD
        elsif verbose
          sprintf( "%s ... ok\n", target )
        end
      end
    end
  end
end
