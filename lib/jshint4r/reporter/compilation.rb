module JSHint4r
  module Reporter
    class Compilation
      include Reporter

      #
      # [param]  String target
      # [param]  Array  errors
      # [return] String or nil
      #
      def report( target, errors, verbose = false )
        if errors and errors.size > 0
          errors.map { |error|
            e = key_symbolize( error )
            sprintf( "%s:%s:%s: %s\n%s",
                     target,
                     e[:line], e[:character], e[:reason], e[:evidence] )
          }.join("\n") << "\n"
        elsif verbose
          sprintf( "%s ... ok\n", target )
        end
      end
    end
  end
end
