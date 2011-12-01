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

    def current
      @format[@index]
    end

    def next
      value = current
      @index += 1
      value
    end

    private
      def load_format(format_str)
        @format = WrapArray.new(
          format_str.strip.scan(/(?:\w+|\s+)/)
        )
      end
  end
end
