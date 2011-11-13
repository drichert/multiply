require 'spec_helper'

describe Multiply::Words do
  let(:lists) { %w{acronym alnum cap lower mixed} }
  let(:mw) { Multiply::Words.new }

  describe "#initialize" do
    it "loads all word lists as WrapArrays" do
      lists.each {|list|
        mw.send(list.to_sym).should be_a(Multiply::WrapArray)
      }
    end
  end

  describe "#acronym" do
    it "returns an array of acronyms" do
      mw.acronym.each {|word| word.should match(/^[A-Z\-&\/\.\d]+$/) }
    end
  end

  describe "#alnum" do
    it "returns an array of alphanumeric words" do
      mw.alnum.each {|word| word.should match(/^[A-Za-z0-9]+$/) }
    end
  end

  describe "#cap" do
    it "returns an array of capitalized words" do
      mw.cap.each {|word| word.should match(/^[A-Z]/) }
    end
  end

  describe "#lower" do
    it "returns an array of lowercase words" do
      pending "Takes a long time to run this spec"
      mw.lower.each {|word| word.should match(/^[a-z]+$/) }
    end
  end

  describe "#mixed" do
    it "returns an array of mixed case words" do
      mw.mixed.each {|word|
        word.should match(/^[A-Za-z'\+&\-\/$\d(),\.:\\!<? ]+$/)
      }
    end
  end

  describe "#all" do
    it "should return a WrapArray" do
      mw.all.should be_a(Multiply::WrapArray)
    end

    it "returns an array of all words" do
      pending "Takes a long time to run this spec"

      lists.each {|list|
        mw.send(list.to_sym).each {|word|
          mw.all.should include(word)
        }
      }
    end
  end

end


