require 'spec_helper'

describe JSHint4r::Linter do
  before(:all) {
    @linter = JSHint4r::Linter.new( JSHint4r::Source.context,
                                    {'undef' => false,
                                     'asi'   => false} )
  }

  describe 'lint' do
    context 'no errors' do
      subject {
        @linter.lint( fixture( 'no_errors.js' ) )
      }
      it {
        should be_nil
      }
    end
    describe 'missing smicolon' do
      subject {
        @linter.lint( fixture( 'missing_semicolon.js' ) )
      }
      describe 'class Array' do
        it {
          subject.class.should eq(Array)
        }
      end
      describe 'Array of one Hash' do
        it {
          subject.first.class.should eq(Hash)
        }
      end
    end
  end
end

