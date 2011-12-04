module Multiply
  class Generator
    attr_reader :formatter, :multiplier

    def initialize(*texts)
      @formatter  = Formatter.new("x ")
      @multiplier = Multiplier.new(*texts)
    end

    def generate(num_words)
      words = []
      num_words.times { words << multiplier.next }

      formatter.format_text(words)
    end
  end
end
