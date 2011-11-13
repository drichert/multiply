require 'spec_helper'

describe Multiply::Multiplier do
  let(:multiplier) {
    Multiply::Multiplier.new(*text_strings)
  }
  let(:mock_words) {
    mock(
      Multiply::Words,
      :all => Multiply::WrapArray.new(["one", "two", "three", "four", "five"])
    )
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

  describe "#current_wordlist_indexes" do
    it "should return an array of indexes corresponding to wordlist positions of current words" do
      multiplier.instance_variable_set(:@words, mock_words)
      multiplier.stub(:current).and_return(["two", "four", "one"])
      multiplier.current_wordlist_indexes.should eql([1, 3, 0])
    end
  end

  describe "#next" do
    it "returns a word from wordlist determined by multiplication" do
      multiplier.instance_variable_set(:@words, mock_words)
      multiplier.stub(:current_wordlist_indexes).and_return([1, 2, 3])
      multiplier.next.should == "two"
    end

    describe "increments @indexes values" do
      it "should increment each @indexes value by 1" do
        orig_indexes = multiplier.instance_variable_get(:@indexes).dup
        multiplier.next
        multiplier.instance_variable_get(:@indexes).each_with_index {|v, ndx|
          v.should == orig_indexes[ndx] + 1
        }
      end
    end

    context "@indexes value is greater than length of corresponding @texts value" do
      it "resets @indexes value to 0" do
        m = Multiply::Multiplier.new(["a", "b", "c", "d"], ["e", "f", "g"])
        m.instance_variable_set(:@indexes, [3, 2])
        m.next
        m.instance_variable_get(:@indexes)[0].should == 0
      end
    end
  end

  describe "#cycle_complete?" do
    context "when all values in @indexes are 0" do
      it "returns true" do
        multiplier.instance_variable_set(:@indexes, [0, 0])
        multiplier.cycle_complete?.should be_true
      end
    end

    context "when there is at least one non-zero value in @indexes array" do
      it "returns false" do
        multiplier.instance_variable_set(:@indexes, [0, 1])
        multiplier.cycle_complete?.should be_false
      end
    end
  end
end
