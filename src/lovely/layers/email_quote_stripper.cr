require "./quote_stripper"

module Lovely
  module Layers
    class EmailQuoteStripper < QuoteStripper
      def call(text, width)
        wrapped = next_layer.call(stripped(text), width - quote(text).size)
        wrapped.lines.map { |line| fixed_quote(quote(text)) + line }.join("\n")
      end

      private def fixed_quote(quote)
        quote.empty? ? "" : quote.delete(' ') + ' '
      end

      private def quotes
        /^>[> ]*/
      end
    end
  end
end
