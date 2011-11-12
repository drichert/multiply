require 'spec_helper'

describe Multiply::Texts do

  describe "#initialize" do
    before(:each) { @texts = Multiply::Texts.new(*text_strings) }

    it "loads texts specified by arguments" do
      text_strings.each_index {|ndx|
        @texts.instance_variable_get(:@texts)[ndx].should be_an(Array)
      }
      @texts.instance_variable_get(:@texts).each {|txt|
        txt.each {|word| word.should be_a(String) }
      }
    end

    describe "sets up @indexes array to track index positions in @texts" do
      it "sets all @indexes values to 0" do
        indexes = @texts.instance_variable_get(:@indexes)
        texts   = @texts.instance_variable_get(:@texts)
        indexes.should eql([0] * texts.length)
      end
    end

    it "assigns loaded texts as arrays to @texts array" do
      @texts.instance_variable_get(:@texts).each {|txt|
        txt.should be_an(Array)
      }
    end

    it "raises an exception if less than two texts are given" do
      expect {
        Multiply::Texts.new(text_strings.first)
      }.to raise_exception(
        ArgumentError, "must specify at least 2 texts"
      )
    end

    it "raises an exception if a text argument is not a File, Array, or String" do
      expect {
        Multiply::Texts.new(text_strings.first, 2)
      }.to raise_exception(
        ArgumentError, "invalid text argument"
      )
    end

    it "accepts Files as texts arguments" do
      lambda { Multiply::Texts.new(*text_files) }.should_not raise_exception
    end

    it "accepts Strings as texts arguments" do
      lambda { Multiply::Texts.new(*text_strings) }.should_not raise_exception
    end

    it "accepts Arrays as texts arguments" do
      lambda { Multiply::Texts.new(*text_arrays) }.should_not raise_exception
    end

  end

  describe "#texts" do
    it "returns an array of arrays of words" do
      Multiply::Texts.new(*text_strings).texts.each {|txt|
        txt.each {|w| w.should be_a(String) }
      }
    end
  end
end
