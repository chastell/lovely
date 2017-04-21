require "./layers/basic_wrapper"
require "./layers/hangout_wrapper"
require "./layers/layer"
require "./layers/one_letter_gluer"

module Lovely
  class Wrapper
    def call(text, width = 72)
      stack.call(text, width: width)
    end

    private def stack
      layers = [Layers::OneLetterGluer, Layers::BasicWrapper,
                Layers::HangoutWrapper]
      layers.reverse.reduce(Layers::Layer) { |inner, outer| outer.new(inner) }
    end
  end
end
