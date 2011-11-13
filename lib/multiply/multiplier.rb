module Multiply
  class Multiplier
    def initialize(*texts)
      @words   = Words.new
      @texts   = Texts.new(*texts)
      @indexes = ([0] * @texts.texts.length)
    end

    def current
      words = []
      @texts.texts.each_with_index {|text, ndx|
        words << text[@indexes[ndx]]
      }
      words
    end

    def current_indexes
      current.map {|word| wordlist_index(word) }
    end

    private
      def wordlist_index(word, list_method = :all)
        @words.send(list_method).index(word)
      end
  end
end
