require 'spec_helper'

describe JSHint4r::Result do
  def __DATA__
    File.read(__FILE__).sub(/.*\n__END__\n(.*)$/m, '\1')
  end

  before(:all) {
    @errors = JSHint4r::Result.new( 'target.js', __DATA__ )
  }

  describe 'target' do
    subject {
      @errors.target
    }
    it {
      should == 'target.js'
    }
  end

  describe 'errors' do
    subject {
      @errors.errors
    }
    it {
      subject.class.should be(Array)
    }
    it {
      subject.size.should == 2
    }
  end

  describe 'parse' do
    context 'simple key-value' do
      subject {
        @errors.parse( "{ abc: 'def' }" )
      }
      it {
        should eq( { 'abc' => 'def' } )
      }
    end
    context 'value is bare word' do
      subject {
        @errors.parse( "{ abc: def }" )
      }
      it {
        expect{subject}.should raise_error(ExecJS::ProgramError)
      }
    end
    context "'[]'" do
      subject {
        @errors.parse( '[]' )
      }
      it {
        should eq([])
      }
    end
    context 'empty array' do
      subject {
        @errors.parse( [] )
      }
      it {
        expect{should}.to raise_error(TypeError)
      }
    end
    context 'empty string' do
      subject {
        @errors.parse( '' )
      }
      it {
        should be_nil
      }
    end
    context 'nil' do
      subject {
        @errors.parse( nil )
      }
      it {
        should be_nil
      }
    end
    context 'abc' do
      subject {
        @errors.parse( 'abc' )
      }
      it {
        expect{subject}.to raise_error(ExecJS::ProgramError)
      }
    end
    context 'var abc' do
      subject {
        @errors.parse( 'var abc' )
      }
      it {
        expect{should}.to raise_error(ExecJS::ProgramError)
      }
    end
  end
end

__END__
[ { id: '(error)',
    raw: 'Missing semicolon.',
    evidence: '    itself.edition = \'2011-04-16\'',
    line: 4019,
    character: 32,
    a: undefined,
    b: undefined,
    c: undefined,
    d: undefined,
    reason: 'Missing semicolon.' },
  { id: '(error)',
    raw: 'Missing semicolon.',
    evidence: '    exports.JSHINT = JSHINT',
    line: 4026,
    character: 28,
    a: undefined,
    b: undefined,
    c: undefined,
    d: undefined,
    reason: 'Missing semicolon.' } ]
