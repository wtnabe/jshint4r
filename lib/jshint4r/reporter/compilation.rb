module JSHint4r
  module Reporter
    class Compilation
      include Reporter

      #
      # [param]  String target
      # [param]  Array  errors
      # [return] String or nil
      #
      def report( target, errors )
        return nil unless errors

        errors.map { |error|
          e = key_symbolize( error )
          sprintf( "%s:%s:%s: %s\n%s",
                   target, e[:line], e[:character], e[:reason], e[:evidence] )
        }.join("\n") << "\n"
      end
    end
  end
end
