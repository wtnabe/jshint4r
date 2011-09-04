module JSHint4r
  class Result
    def initialize( target, errors )
      @target = target
      @errors = parse( errors )
    end
    attr_reader :target, :errors

    #
    # [param]  String errors
    # [return] Object
    #
    def parse( errors )
      errors = errors || ''
      ExecJS.eval( errors )
    end
  end
end
