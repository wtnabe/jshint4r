module JSHint4r
  class Linter
    #
    # [param] ExecJS::*::Context context
    # [param] Hash opts
    #
    def initialize( context, opts = nil )
      @context = context
      @opts    = opts || {}
    end
    attr_reader :context, :opts

    #
    # [param]  File
    # [return] Array or nil
    #
    def lint( target )
      errors = context.call('JSHINT.run', File.read(target).toutf8, opts )
      if errors
        errors = errors.compact
        errors = allow_unsafe_character(errors) if opts['unsafechar']
      end

      errors
    end

    #
    # [param]  Array errors
    # [return] Array
    #
    def allow_unsafe_character( errors )
      errors.select { |e|
        case e['reason']
        when /Unsafe character\./, /Too many errors\./
          false
        else
          true
        end
      }
    end
  end
end
