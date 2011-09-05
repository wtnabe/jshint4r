module JSHint4r
  class Config
    def initialize( path = nil )
      @excludes = []
      @opts     = {}
      @path     = nil
      @reporter = :text
      @targets  = []
      @verbose  = false

      if path and read_config_file( path )
        @path = path
      end
    end
    attr_reader   :excludes, :opts, :targets, :path
    attr_accessor :reporter, :verbose

    #
    # [param]  String  path
    # [return] Boolean
    #
    def read_config_file( path )
      r = false

      if File.exist?( path )
        conf = YAML.load_file( path )
        if ( conf.is_a? Hash )
          self.excludes = conf['excludes'] if conf.has_key? 'excludes'
          self.opts     = conf['options']  if conf.has_key? 'options'
          self.reporter = conf['reporter'] if conf.has_key? 'reporter'
          self.targets  = conf['src']      if conf.has_key? 'src'
          self.verbose  = conf['verbose']  if conf.has_key? 'verbose'

          r = true
        end
      end

      return r
    end

    #
    # [param]  Objecte ex
    # [return] Array
    #
    def excludes=( ex )
      ex = [ex] unless ex.is_a? Array
      @excludes += ex
    end

    #
    # [param]  Hash opts
    # [return] Hash
    #
    def opts=( opts )
      @opts.merge!( opts )
    end

    #
    # [param]  Object t
    # [return] Array
    #
    def targets=( t )
      t = [t] unless t.is_a? Array
      @targets += t
    end
  end
end
