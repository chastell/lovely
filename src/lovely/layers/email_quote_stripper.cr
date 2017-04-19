require "./quote_stripper"

module Lovely
  module Layers
    class EmailQuoteStripper < QuoteStripper
      private def fixed_quote
        quote.empty? ? "" : quote.delete(' ') + ' '
      end

      private def quotes
        /^>[> ]*/
      end
    end
  end
end
