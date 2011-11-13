require 'spec_helper'

describe Multiply::Multiplier do
  let(:multiplier) {
    Multiply::Multiplier.new(*text_strings)
  }

  describe "#initialize" do
    it "assigns an instance of Multiply::Words to @words" do
      multiplier.instance_variable_get(:@words).should be_a(Multiply::Words)
    end

    it "assigns an instance of Multiply::Texts to @texts" do
      multiplier.instance_variable_get(:@texts).should be_a(Multiply::Texts)
    end

    describe "should set up an array of indexes to index @texts by" do
      it "assigns it to @indexes" do
        multiplier.instance_variable_get(:@indexes).should be_an(Array)
      end

      it "is initialized with 0s" do
        multiplier.instance_variable_get(:@indexes).uniq.should eql([0])
      end

      it "is as long as the number of texts" do
        indexes = multiplier.instance_variable_get(:@indexes)
        texts = multiplier.instance_variable_get(:@texts).texts
        indexes.length.should eql(texts.length)
      end
    end
  end

  describe "#current" do
    it "should return an array of words corresponding to indexes" do
      multiplier.current.should eql(["This", "This"])
    end
  end

  describe "#current_indexes" do
    it "should return an array of indexes corresponding to wordlist positions of current words" do
      m = multiplier
      m.instance_variable_set(
        :@words,
        mock(Multiply::Words, :all => ["one", "two", "three", "four", "five"])
      )
      m.stub(:current).and_return(["two", "four", "one"])
      m.current_indexes.should eql([1, 3, 0])
    end
  end

  describe "#next" do
    it "returns a word determined by multiplication"
    it "increments @indexes values"

    context "@indexes value is greater than length of corresponding @texts value" do
      it "resets @indexes value to 0"
    end
  end

  describe "#cycle_complete?" do
    context "when all values in @indexes are 0" do
      it "returns true", :pending => true
    end

    context "when there is at least one non-zero value in @indexes array" do
      it "returns false", :pending => true
    end
  end
end
