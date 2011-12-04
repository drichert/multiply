module Multiply
  class Formatter
    attr_accessor :index
    attr_reader   :format

    # format_str should be a String matching
    # /[x\s]+/ ("x" or whitespace)
    def initialize(format_str)
      @index = 0

      load_format(format_str)
    end

    # words - an array of words
    def format_text(words)
      words.map do |word|
        format_val = self.send(:next)
        segment    = ""

        # add whitespace
        while format_val.match(/^\s+$/)
          segment += format_val
          format_val = self.send(:next)
        end

        segment += word
      end.join("")
    end

    # get current format value
    def current
      @format[@index]
    end

    # get next format value
    def next
      value = current
      @index += 1
      value
    end

    private
      def load_format(format_str)
        @format = WrapArray.new(
          format_str.scan(/(?:\w+|\s+)/)
        )
      end
  end
end
