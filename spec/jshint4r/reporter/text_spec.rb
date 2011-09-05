require 'spec_helper'

describe JSHint4r::Reporter::Text do
  before(:all) {
    @reporter = JSHint4r.reporter( :text )
  }

  describe 'report' do
    context 'ordinary errors' do
      subject {
        target, errors = sample_error
        @reporter.report( target, errors )
      }
      it {
        should eq(<<EOD)
jshint.js: line 4019, col 32, Missing semicolon.
jshint.js: line 4026, col 28, Missing semicolon.

2 errors
EOD
      }
    end
    describe 'no errors' do
      context 'verbose' do
        subject {
          @reporter.report( 'jshint.js', nil, true )
        }
        it {
          should eq(<<EOD)
jshint.js ... ok
EOD
        }
      end
      context 'silent' do
        subject {
          @reporter.report( 'jshint.js', nil )
        }
        it {
          should be_nil
        }
      end
    end
  end
end
