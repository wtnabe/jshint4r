require 'spec_helper'

describe JSHint4r::Target do
  before(:all) {
    config  = JSHint4r::Config.new( fixture( 'config.yml' ) )
    @target = JSHint4r::Target.new( config.targets, config.excludes )
  }

  describe 'initialize' do
    context 'nil' do
      subject {
        JSHint4r::Target.new nil, nil
      }
      it {
        subject.targets.should eq([])
      }
      it {
        subject.excludes.should eq([])
      }
    end
    context 'no args' do
      subject {
        JSHint4r::Target.new
      }
      it {
        lambda {subject}.should raise_error( ArgumentError )
      }
      it {
        lambda {subject}.should_not raise_error( TypeError )
      }
    end
  end

  describe 'targets' do
    describe 'Array' do
      subject {
        @target.targets.class
      }
      it {
        should eq(Array)
      }
    end
    describe 'size' do
      subject {
        @target.targets.size
      }
      it {
        should > 0
      }
    end
  end

  describe 'excludes' do
    describe 'Array' do
      subject {
        @target.excludes.class
      }
      it {
        should eq(Array)
      }
    end
    describe 'size' do
      subject {
        @target.excludes.size
      }
      it {
        should > 0
      }
    end
  end

  describe 'each' do
    describe 'list' do
      subject {
        side = []
        @target.each { |e|
          side << e
        }

        side
      }
      it {
        should eq(['spec/fixtures/missing_semicolon.js'])
      }
    end
    describe 'exist' do
      subject {
        side = []

        @target.each { |e|
          side << File.exist?( e )
        }

        side
      }
      it {
        should eq([true])
      }
    end
  end

  describe 'real_targets' do
    before(:all) {
      @t = @target.real_targets
    }
    describe 'no_errors.js' do
      subject {
        @t.grep( /no_errors\.js/ )
      }
      it {
        should eq([])
      }
    end
    describe 'directory not exist' do
      subject {
        @t.find { |e| File.directory? e }
      }
      it {
        should be_nil
      }
    end
    describe 'file exists' do
      subject {
        @t.find_all { |e| File.file? e }
      }
      it {
        subject.class.should eq(Rake::FileList)
      }
      it {
        subject.size.should > 0
      }
    end
  end
end
