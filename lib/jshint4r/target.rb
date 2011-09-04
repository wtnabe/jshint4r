module JSHint4r
  class Target
    def initialize( targets, excludes = nil )
      @targets  = targets
      @excludes = excludes || []
    end
    attr_reader :excludes, :targets

    def each( &block )
      @targets.each { |f|
        block.call( f )
      }
    end

    def real_targets
    end
  end
end
