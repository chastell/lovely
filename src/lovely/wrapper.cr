require "./layers/basic_wrapper"

module Lovely
  class Wrapper
    def call(text, width = 72)
      BasicWrapper.new(text, width: width).call
    end
  end
end
