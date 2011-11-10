module Multiply
  VERSION = "0.0.1"

  autoload :WrapArray, 'multiply/wrap_array'

  class << self
    def base_path
      File.expand_path("../..", __FILE__)
    end
  end
end
