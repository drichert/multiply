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

    def current_wordlist_indexes
      current.map {|word| wordlist_index(word) }
    end

    def next
      word = @words.all[current_wordlist_indexes.reduce(:*)]
      increment_indexes
      word
    end

    private
      def wordlist_index(word, list_method = :all)
        @words.send(list_method).index(word)
      end

      def increment_indexes
        ndx = 0
        @indexes.map! {|n|
          n += 1
          if n >= @texts.texts[ndx].length
            n = 0
          end
          ndx += 1
          n
        }
      end
  end
end
