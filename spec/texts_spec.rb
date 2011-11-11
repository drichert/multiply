require 'spec_helper'

describe Multiply::Texts do
  let(:text_strings) {[
    "This is a text about some stuff. The text explains things.",
    "It is a text. It is not a manifesto."
  ]}

  let(:text_arrays) {[
    text_strings.map {|s| s.split(/\s*/) }
  ]}

  let(:text_files) {[
    File.expand_path("../../share/texts/pg37948.txt", __FILE__),
    File.expand_path("../../share/texts/pg37956.txt", __FILE__)
  ]}

  describe "#initialize" do
    before(:each) { @texts = Multiply::Texts.new(*text_strings) }

    it "loads texts specified by arguments" do
      text_strings.each_index {|ndx|
        @texts.instance_variable_get(:@texts)[ndx].should be_an(Array)
      }
    end

    describe "sets up @indexes array to track index positions in @texts" do
      it "sets all @indexes values to 0" do
        indexes = @texts.instance_variable_get(:@indexes)
        texts   = @texts.instance_variable_get(:@texts)
        indexes.should eql([0] * texts.length)
      end
    end

    it "accepts a Multiple::Words object and assigns it to @words"
    it "assigns loaded texts to @texts array"
    it "raises an error if less than two texts are given"
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
