require "./layer"

module Lovely
  module Layers
    class QuoteStripper < Layer

      private def quote(text)
        starts = text.lines.map { |line| line[quotes]? }.uniq
        starts.size == 1 ? starts.first || "" : ""
      end

      private def stripped(text)
        text.lines.map { |line| line[quote(text).size..-1] }.join("\n")
      end
    end
  end
end
