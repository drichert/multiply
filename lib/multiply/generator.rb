module Multiply
  class Generator
    attr_reader :formatter, :multiplier

    def initialize(*texts)
      @formatter  = Formatter.new("x ")
      @multiplier = Multiplier.new(*texts)
    end

    def generate(num_words)
    end
  end
end
