require "./layers/basic_wrapper"

module Lovely
  class Wrapper
    def call(text, width = 72)
      Layers::BasicWrapper.new.call(text, width: width)
    end
  end
end
