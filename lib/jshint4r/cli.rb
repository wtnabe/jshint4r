require 'optparse'

module JSHint4r
  class CLI
    def self.run
      self.new.run
    end

    def run
      paths = args.permute( ARGV )
      l     = Linter.new( Source.context, config.opts )
      r     = JSHint4r.reporter( config.reporter )
      targets( paths ).each { |f|
        s = r.report( f, l.lint( f ) )
        puts s if s
      }
    end

    #
    # [param]  String path
    # [return] JSHint4r::Config
    #
    def config( path = nil )
      if ( !@config )
        @config = Config.new( path )
      end

      @config
    end

    #
    # [param]  Array path
    # [return] JSHint4r::Target
    #
    def targets( paths )
      Target.new( config.targets + paths || [], config.excludes.uniq )
    end

    #
    # [return] OptionParser
    #
    def args
      opts = OptionParser.new { |opt|
        opt.banner = 'Usage: jshint4r [options] path1 path2 ...'
        opt.on( '-c', '--config PATH' ) { |path|
          if File.exist?( path )
            config( path )
          end
        }
        opt.on( '-e', '--exclude PATH' ) { |path|
          config.excludes = path
        }
        opt.on( '-o', '--options KEY=VALUE' ) { |opt|
          o = opt.split('=', 2)
          if o.size == 2
            config.opts = { o[0] => o[1] }
          end
        }
        opt.on( '-r', '--reporter REPORTER' ) { |reporter|
          config.reporter = reporter
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
