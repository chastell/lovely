require "./layers/basic_wrapper"
require "./layers/one_letter_gluer"

module Lovely
  class Wrapper
    def call(text, width = 72)
      stack = Layers::OneLetterGluer.new(Layers::BasicWrapper.new)
      stack.call(text, width: width)
    end
  end
end
