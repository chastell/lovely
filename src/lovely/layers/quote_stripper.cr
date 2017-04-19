require "./layer"

module Lovely
  module Layers
    class QuoteStripper < Layer
      def call(@text, @width)
        wrapped = next_layer.call(stripped, width - quote.size)
        wrapped.lines.map { |line| fixed_quote + line }.join("\n")
      end

      private def fixed_quote
        quote
      end

      private def quote
        starts = text.lines.map { |line| line[quotes]? }.uniq
        starts.size == 1 ? starts.first || "" : ""
      end

      private def quotes
        //
      end

      private def stripped
        text.lines.map { |line| line[quote.size..-1] }.join("\n")
      end
    end
  end
end
