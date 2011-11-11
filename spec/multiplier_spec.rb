require 'spec_helper'

describe Multiply::Multiplier do
  let(:multiplier) { Multiply::Multiplier.new }

  describe "#initialize" do
    it "assigns an instance of Multiply::Words to @words" do
      multiplier.instance_variable_get(:@words).should be_a(Multiply::Words)
    end
  end

  describe "#word" do
    it "returns a word determined by multiplication"
    it "increments @indexes value "

    context "@indexes value is greater than length of corresponding @texts value" do
      it "resets @indexes value to 0"
    end
  end

  describe "#cycle_complete?" do
    context "when all values in @indexes are 0" do
      it "returns true"
    end

    context "when there is at least one non-zero value in @indexes array" do
      it "returns false"
    end
  end
end
