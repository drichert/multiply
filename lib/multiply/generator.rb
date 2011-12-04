module Multiply
  class Generator
    attr_reader :formatter, :multiplier

    def initialize(options = {})
      @formatter  = Formatter.new(options[:format] || "x ")
      @multiplier = Multiplier.new(*options[:texts])
    end

    def generate(num_words)
      words = []
      num_words.times { words << multiplier.next }

      formatter.format_text(words)
    end
  end
end
