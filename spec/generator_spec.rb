require 'spec_helper'

module Multiply
  describe Generator do
    let(:mock_words) {
      double(Words, :all => WrapArray.new(%w{one two three four five})
    }

    before(:each) do
      Words.stub(:new).and_return(mock_words)
    end

    subject { Generator.new(*text_strings) }

    its(:formatter)  { should be_a(Formatter) }
    its(:multiplier) { should be_a(Multiplier) }

    describe "#generate" do
      context "6 passed in" do
        subject { Generator.new(*text_strings).generate(6) }

        it { should == "" }
      end
    end

  end
end

