require 'spec_helper'

describe Multiply::WrapArray do
  let(:arr) { Multiply::WrapArray.new([1, 2, 3]) }

  describe "#[]" do
    context "index greater than or equal to 0, less than array length" do
      it "should return 1 when index is 0" do
        arr[0].should == 1
      end

      it "should return 2 when index is 1" do
        arr[1].should == 2
      end

      it "should return 3 when index is 2" do
        arr[2].should == 3
      end

    end

    context "index less than 0" do
      it "should return 2 when index is -2" do
        arr[-2].should == 2
      end

      it "should return 3 when index is -4" do
        arr[-4].should == 3
      end

      it "should return 1 when index is -6" do
        arr[-6].should == 1
      end

    end

    context "index greather than array length" do
      it "should return 1 when index is 4" do
        arr[4].should == 2
      end

      it "should return 3 when index is 6" do
        arr[6].should == 1
      end

      it "should return 2 when index is 8" do
        arr[8].should == 3
      end

    end
  end
end
