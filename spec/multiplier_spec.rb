require 'spec_helper'

describe Multiply::Multiplier do
  let(:mul) { Multiply::Multiplier.new(:texts => text_strings) }

  let(:mock_words) {
    mock(
      Multiply::Words,
      :all => Multiply::WrapArray.new(["one", "two", "three", "four", "five"])
    )
  }

  describe "#initialize" do
    it "assigns an instance of Multiply::Words to @words" do
      mul.instance_variable_get(:@words).should be_a(Multiply::Words)
    end

    it "assigns an instance of Multiply::Texts to @texts" do
      mul.instance_variable_get(:@texts).should be_a(Multiply::Texts)
    end

    describe "should set up an array of indexes to index @texts by" do
      it "assigns it to @indexes" do
        mul.instance_variable_get(:@indexes).should be_an(Array)
      end

      it "is initialized with 0s" do
        mul.instance_variable_get(:@indexes).uniq.should eql([0])
      end

      it "is as long as the number of texts" do
        indexes = mul.instance_variable_get(:@indexes)
        texts = mul.instance_variable_get(:@texts).texts
        indexes.length.should eql(texts.length)
      end
    end

    describe ":words option" do
      let(:words) { %w{The dwarves of yore} }

      it "specifies wordlist to use for @words" do
        Multiply::Words.should_receive(:new).with(:words => words)
        Multiply::Multiplier.new(:texts => text_strings, :words => words)
      end
    end
  end

  describe "#current" do
    it "should return an array of words corresponding to indexes" do
      mul.current.should eql(["This", "This"])
    end
  end

  describe "#current_wordlist_indexes" do
    it "should return an array of indexes corresponding to wordlist positions of current words" do
      mul.instance_variable_set(:@words, mock_words)
      mul.stub(:current).and_return(["two", "four", "one"])
      mul.current_wordlist_indexes.should eql([1, 3, 0])
    end
  end

  describe "#next" do
    it "returns a word from wordlist determined by multiplication" do
      mul.instance_variable_set(:@words, mock_words)
      mul.stub(:current_wordlist_indexes).and_return([1, 2, 3])
      mul.next.should == "two"
    end

    context "when one of the current words is not found in wordlist" do
      it "should not include that word's index when multiplying" do
        mul.stub(:current_wordlist_indexes).and_return([nil, 2, 3])
        lambda { mul.next }.should_not raise_error
      end
    end

    context "when all of the current words are not found in wordlist" do
      it "should return '--'" do
        mul.stub(:current_wordlist_indexes).and_return([nil] * 3)
        mul.next.should == "--"
      end
    end

    describe "increments @indexes values" do
      it "should increment each @indexes value by 1" do
        orig_indexes = mul.instance_variable_get(:@indexes).dup
        mul.next
        mul.instance_variable_get(:@indexes).each_with_index {|v, ndx|
          v.should == orig_indexes[ndx] + 1
        }
      end
    end

    context "@indexes value is greater than length of corresponding @texts value" do
      it "resets @indexes value to 0" do
        m = Multiply::Multiplier.new(
          :texts => [["a", "b", "c", "d"], ["e", "f", "g"]]
        )
        m.instance_variable_set(:@indexes, [3, 2])
        m.next
        m.instance_variable_get(:@indexes)[0].should == 0
      end
    end
  end

  describe "#cycle_complete?" do
    context "when all values in @indexes are 0" do
      it "returns true" do
        mul.instance_variable_set(:@indexes, [0, 0])
        mul.cycle_complete?.should be_true
      end
    end

    context "when there is at least one non-zero value in @indexes array" do
      it "returns false" do
        mul.instance_variable_set(:@indexes, [0, 1])
        mul.cycle_complete?.should be_false
      end
    end
  end
end
