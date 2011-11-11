module Multiply
  VERSION = "0.0.1"

  autoload :WrapArray,  'multiply/wrap_array'
  autoload :Words,      'multiply/words'
  autoload :Texts,      'multiply/texts'
  autoload :Multiplier, 'multiply/multiplier'

  class << self
    def base_path
      File.expand_path("../..", __FILE__)
    end
  end
end
