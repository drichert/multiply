module Multiply
  class Generator
    attr_reader :formatter, :multiplier

    def initialize(*texts)
      @formatter  = Formatter.new("- ")
      @multiplier = Multiplier.new(*texts)
    end
  end
end
