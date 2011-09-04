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
      context.call('JSHINT.run', File.read(target), opts )
    end
  end
end
