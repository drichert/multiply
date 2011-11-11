module Multiply
  class Texts
    def initialize(*texts)
      @texts = []
      texts.each_with_index {|txt|
        @texts << txt.split(/\s*/)
      }

      @indexs = ([0] * @texts.length)
    end
  end
end
