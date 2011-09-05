require 'spec_helper'

describe JSHint4r::Config do
  before(:all) {
    @config = JSHint4r::Config.new( fixture( 'config.yml' ) )
  }

  describe 'initialize' do
    context 'with filename' do
      subject {
        JSHint4r::Config.new( fixture( 'config.yml' ) ).path
      }
      it {
        should_not be_nil
      }
    end
  end

  describe 'excludes' do
    subject {
      @config.excludes
    }
    it {
      should eq(['**/no_errors.js'])
    }
  end

  describe 'excludes =' do
    subject {
      @config.excludes = 'foobar'
      @config.excludes
    }
    it {
      should eq( %w( **/no_errors.js foobar ) )
    }
  end

  describe 'opts' do
    subject {
      @config.opts
    }
    it {
      should eq( 'undef' => false,
                 'asi'   => true  )
    }
  end

  describe 'opts =' do
    subject {
      @config.opts = {'laxbreak' => true}
      @config.opts
    }
    it {
      should eq( 'undef'    => false,
                 'asi'      => true,
                 'laxbreak' => true )
    }
  end

  describe 'reporter' do
    subject {
      @config.reporter
    }
    it {
      should eq(:compilation)
    }
  end

  describe 'reporter =' do
    subject {
      @config.reporter = :xml
      @config.reporter
    }
    it {
      should eq(:xml)
    }
  end

  describe 'targets' do
    subject {
      @config.targets
    }
    it {
      should eq( ['spec/fixtures/'] )
    }
  end

  describe 'targets =' do
    subject {
      @config.targets = 'vendor/jshint'
      @config.targets
    }
    it {
      should eq( %w( spec/fixtures/ vendor/jshint ) )
    }
  end

  describe 'verbose' do
    subject {
      @config.verbose
    }
    it {
      should be_true
    }
  end

  describe 'verbose =' do
    subject {
      @config.verbose = false
    }
    it {
      should be_false
    }
  end
end
