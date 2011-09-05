require 'rake'

module JSHint4r
  class Target
    def initialize( targets, excludes = nil )
      @targets  = targets  || []
      @excludes = excludes || []
    end
    attr_reader :targets, :excludes

    def each( &block )
      real_targets.each { |f|
        block.call( f )
      }
    end

    #
    # [return] Rake::FileList
    #
    def real_targets
      if ( !@real_targets )
        @real_targets = target_files
      end

      @real_targets
    end

    protected
    #
    # [return] Rake::FileList
    #
    def target_files
      t = clean( FileList[targets] )

      t = FileList[t.select { |e|
                     e if File.exist?( e )
                   }.map { |e|
                     if File.directory?( e )
                       Dir.glob( File.join( e, '**/*.js' ) )
                     else
                       e
                     end
                   }.flatten.uniq]

      clean( t )
    end

    #
    # [param]  Rake::FileList targets
    # [return] Rake::FileList
    #
    def clean( targets )
      excludes.each { |ex|
        targets.exclude( ex )
      }

      targets
    end
  end
end
