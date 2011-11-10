require 'spec_helper'

describe Multiply do
  describe "::VERSION" do
    it "should be a valid SemVer version string" do
      Multiply::VERSION.should match(/^(\d+\.){2}\d+([a-z](\w+)?)?$/)
    end
  end

  describe "::base_path" do
    it "should return the absolute root path of the application" do
      Multiply::base_path.should == File.expand_path("../..", __FILE__)
    end
  end
end
