require 'spec_helper'

describe JSHint4r::Reporter::Compilation do
  before(:all) {
    @reporter = JSHint4r.reporter( :compilation )
  }

  describe 'report' do
    context 'ordinary errors' do
      subject {
        target, errors = sample_error
        @reporter.report( target, errors )
      }
      it {
        should eq(<<EOD)
jshint.js:4019:32: Missing semicolon.
    itself.edition = '2011-04-16'
jshint.js:4026:28: Missing semicolon.
    exports.JSHINT = JSHINT
EOD
      }
    end
    context 'no errors' do
      subject {
        @reporter.report( 'jshint.js', nil )
      }
      it {
        should be_nil
      }
    end
  end
end
