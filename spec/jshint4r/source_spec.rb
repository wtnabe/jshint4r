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
  end

  describe 'context' do
    before(:all) {
      @subject = JSHint4r::Source.context
    }
    context 'ExecJS::*::Context object' do
      it {
        @subject.should be_respond_to(:exec)
      }
      it {
        @subject.should be_respond_to(:eval)
      }
      it {
        @subject.should be_respond_to(:call)
      }
    end
    context 'singleton' do
      it {
        JSHint4r::Source.context.object_id.should be(@subject.object_id)
      }
    end
  end
end
