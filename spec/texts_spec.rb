require 'spec_helper'

describe Multiply::Texts do
  describe "#initialize" do
    it "loads texts specified by arguments"
    it "accepts a Multiple::Words object and assigns it to @words"
    it "assigns loaded texts to @texts array"
    it "sets up @indexes array to track index positions in @texts"
    it "raises an error if less than two texts are given"
  end

  describe "#word" do
    it "returns a word determined by multiplication"

    context "@indexes value is less than length of corresponding @texts value"  do
      it "increments @indexes value "
    end

    context "@indexes value is greater than length of corresponding @texts value" do
      it "resets @indexes value to 0"
    end

  end

  describe "#cycle_complete?" do
    context "when all values in @indexes are 0"
      it "returns true"
    end

    context "when there is at least one non-zero value in @indexes array" do
      it "returns false"
    end
  end
end
