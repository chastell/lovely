require "./layers/basic_wrapper"
require "./layers/code_comment_stripper"
require "./layers/email_quote_stripper"
require "./layers/hangout_wrapper"
require "./layers/layer"
require "./layers/one_letter_gluer"

module Lovely
  class Wrapper
    def call(text, width = 72)
      text.split(/^[\/#>]* *\n/m).map do |line|
        stack.call(line, width: width).tr("\u00A0", " ")
      end.join("\n\n")
    end

    private def stack
      layers = [Layers::CodeCommentStripper, Layers::EmailQuoteStripper,
                Layers::OneLetterGluer, Layers::BasicWrapper,
                Layers::HangoutWrapper]
      layers.reverse.reduce(Layers::Layer) { |inner, outer| outer.new(inner) }
    end
  end
end
