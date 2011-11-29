require 'spec_helper'

module Multiply
  describe Formatter do
    let(:format)    { "-\t-\n-  -" }
    let(:formatter) { Formatter.new(format) }

    subject { formatter }

    describe "#initialize" do
      its(:index)  { should == 0 }
      its(:format) { should be_an(Array) }
    end

    describe "#current" do
      its(:current) { should == "-" }
    end

    describe "#next" do
      context "first call" do
        its(:next) { should == "-" }
      end

      context "second call" do
        before do
          @f = formatter
          @f.next
        end

        subject { @f }

        its(:next) { should == "\t" }
      end

      it "increments @index" do
        expect {
          formatter.next
        }.to change {
          formatter.instance_variable_get(:@index)
        }.by(1)
      end
    end
  end
end
