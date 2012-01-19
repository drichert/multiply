module Multiply
  class Multiplier
    def initialize(options = {})
      raise ArgumentError, "missing :texts option" if options[:texts].nil?

      @words   = Words.new
      @texts   = Texts.new(*options[:texts])
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
      word = next_index.nil? ? "--" : @words.all[next_index]
      increment_indexes
      word
    end

    def cycle_complete?
      @indexes.uniq == [0]
    end

    private
      def wordlist_index(word, list_method = :all)
        @words.send(list_method).index(word)
      end

      # Multiply current wordlist indexes (removing nils)
      def next_index
        current_wordlist_indexes.compact.reduce(:*)
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
