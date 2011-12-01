require 'spec_helper'

module Multiply
  describe Formatter do
    let(:format)    { "X XX\tX\nX  X" }
    let(:formatter) { Formatter.new(format) }

    subject { formatter }

    describe "#initialize" do
      its(:index)  { should == 0 }
      its(:format) { should be_an(Array) }
    end

    describe "#current" do
      its(:current) { should == "X" }
    end

    describe "#next" do
      context "format is \"X X\\tX\\nX  X\"" do
        before { @fmtr = formatter }

        context "first call" do
          subject { @fmtr.next }
          it      { should == "X" }
        end

        context "second call" do
          subject {
            @fmtr.next
            @fmtr.next
          }

          it { should == " " }
        end

        context "third call" do
          subject {
            2.times { @fmtr.next }
            @fmtr.next
          }

          it { should == "XX" }
        end

        context "fourth call" do
          subject {
            3.times { @fmtr.next }
            @fmtr.next
          }

          it { should == "\t" }
        end
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
