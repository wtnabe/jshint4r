require 'spec_helper'

class JSHint4r::TestingReporter
  include JSHint4r::Reporter
end

describe JSHint4r::Reporter do
  describe 'reporter' do
    context 'no args' do
      subject {
        JSHint4r.reporter
      }
      it {
        subject.class.should be(JSHint4r::Reporter::Text)
      }
    end
    context :text do
      subject {
        JSHint4r.reporter( :text )
      }
      it {
        subject.class.should be(JSHint4r::Reporter::Text)
      }
    end
    context :compilation do
      subject {
        JSHint4r.reporter( :compilation )
      }
      it {
        subject.class.should be(JSHint4r::Reporter::Compilation)
      }
    end
  end

  describe 'symbolize' do
    subject {
      JSHint4r::TestingReporter.new
    }
    it {
      subject.key_symbolize( 'abc' => 123 ).should eq( :abc => 123 )
    }
  end
end
