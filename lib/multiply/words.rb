module Multiply
  # Word lists from ibiblio http://bit.ly/rKBkZA

  class Words
    @@lists = %w{acronym alnum cap lower mixed}
    @@lists.each {|list|
      self.class_eval { attr_reader list.to_sym }
    }

    def initialize
      @@lists.each {|list|
        f = File.open(
          File.join(Multiply::base_path, "share", "words", list)
        )
        instance_variable_set(
          "@#{list}".to_sym,
          WrapArray.new(
            f.read.split("\n").reject {|ln| ln.start_with?("#") }
          )
        )
      }
    end

    def all
      acronym + alnum + cap + lower + mixed
    end
  end
end
