require "./layer"

module Lovely
  module Layers
    class EmailQuoteStripper < Layer
      QUOTES = /^>[> ]*/

      def call(text, width)
        wrapped = next_layer.call(stripped(text), width - quote(text).size)
        wrapped.lines.map { |line| fixed_quote(quote(text)) + line }.join("\n")
      end

      private def fixed_quote(quote)
        quote.empty? ? "" : quote.delete(' ') + ' '
      end

      private def quote(text)
        starts = text.lines.map { |line| line[QUOTES]? }.uniq
        starts.size == 1 ? starts.first || "" : ""
      end

      private def stripped(text)
        text.lines.map { |line| line[quote(text).size..-1] }.join("\n")
      end
    end
  end
end
