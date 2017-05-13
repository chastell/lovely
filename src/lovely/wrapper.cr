require "./layers/basic_wrapper"
require "./layers/hangout_wrapper"
require "./layers/layer"
require "./layers/one_letter_gluer"

module Lovely
  class Wrapper
    NBSP = ' '

    def call(text, width = 72)
      text.split("\n\n").map do |line|
        stack.call(line, width: width).tr(NBSP.to_s, " ")
      end.join("\n\n")
    end

    private def stack
      layers = [Layers::EmailQuoteStripper, Layers::OneLetterGluer,
                Layers::BasicWrapper, Layers::HangoutWrapper]
      layers.reverse.reduce(Layers::Layer) { |inner, outer| outer.new(inner) }
    end
  end
end
