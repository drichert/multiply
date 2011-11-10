module Multiply
  class WrapArray < Array
    def [](ndx)
      super(ndx % self.length)
    end
  end
end
