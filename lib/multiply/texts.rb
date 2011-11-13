module Multiply
  class Texts
    attr_reader :texts

    def initialize(*texts)
      if texts.length < 2
        raise ArgumentError, "must specify at least 2 texts"
      end

      @texts = process_texts(texts)
      @indexes = ([0] * @texts.length)
    end

    private
      def process_texts(texts)
        texts.map do |txt|
          if txt.is_a?(File)
            txt.read.split(/\s+/)
          elsif txt.is_a?(String)
            txt.split(/\s+/)
          elsif txt.is_a?(Array)
            txt.map {|t| t.to_s }
          else
            raise ArgumentError, "invalid text argument"
          end
        end
      end

  end
end
