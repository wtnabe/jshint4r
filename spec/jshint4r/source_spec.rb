require 'spec_helper'

describe JSHint4r::Source do
  describe 'src' do
    describe 'include jshint.js' do
      it {
        JSHint4r::Source.src.should be_include('JSHINT')
      }
    end
    describe 'include jshint_runner.js' do
      it {
        JSHint4r::Source.src.should be_include('JSHINT.run')
      }
    end
    describe 'DRY' do
      it {
        JSHint4r::Source.src.scan('JSHINT.run').size.should eq(1)
      }
    end
  end
end
