require 'spec_helper'

describe Multiply::Texts do
  describe "#initialize" do
    it "loads texts specified by arguments"
    it "accepts a Multiple::Words object and assigns it to @words"
    it "assigns loaded texts to @texts array"
    it "sets up @indexes array to track index positions in @texts"
  end

  describe "#word" do
    it "returns a word as determined by multiplication"
    it "increments each value in @indexes array"
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
