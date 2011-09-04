require 'optparse'

module JSHint4r
  class CLI
    def self.run
      self.new.run
    end

    def initialize
      @excludes = []
      @reporter = :text
      @opts     = {}
    end
    attr_reader :excludes, :reporter, :opts

    def run
      paths = args.permute( ARGV )
      l     = Linter.new( Source.context, opts )
      r     = JSHint4r.reporter( reporter )
      targets( paths ).each { |f|
        puts r.report( f, l.lint( f ) )
      }
    end

    def targets( paths )
      Target.new( paths || [], excludes )
    end

    def args
      opts = OptionParser.new { |opt|
        opt.banner = 'Usage: jshint4r [options] path1 path2 ...'
        opt.on( '-e', '--exclude PATH' ) { |path|
          if File.exist?
            @excludes << [path]
          end
        }
        opt.on( '-o', '--option KEY=VALUE' ) { |opt|
          o = opt.split('=', 2)
          if o.size == 2
            @opts.merge!( o[0] => o[1] )
          end
        }
        opt.on( '-r', '--reporter REPORTER' ) { |reporter|
          @reporter = reporter
        }
      }

      if ARGV.size == 0
        puts opts.help
        exit
      else
        opts
      end
    end
  end
end
