require 'spec_helper'

module Multiply
  describe Generator do
    subject { Generator.new(*text_strings) }

    its(:formatter)  { should be_a(Formatter) }
    its(:multiplier) { should be_a(Multiplier) }
  end
end

