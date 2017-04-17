require "./layer"

module Lovely
  module Layers
    class QuoteStripper < Layer

      private def quote
        starts = text.lines.map { |line| line[quotes]? }.uniq
        starts.size == 1 ? starts.first || "" : ""
      end

      private def stripped
        text.lines.map { |line| line[quote.size..-1] }.join("\n")
      end
    end
  end
end
