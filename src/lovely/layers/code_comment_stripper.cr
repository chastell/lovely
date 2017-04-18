require "./quote_stripper"

module Lovely
  module Layers
    class CodeCommentStripper < QuoteStripper
      def call(@text, @width)
        wrapped = next_layer.call(stripped, width - quote.size)
        wrapped.lines.map { |line| fixed_quote + line }.join("\n")
      end

      private def fixed_quote
        quote
      end

      private def quotes
        /^\s*(\/\/|#) /
      end
    end
  end
end
