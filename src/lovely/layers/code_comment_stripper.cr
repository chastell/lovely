require "./layer"

module Lovely
  module Layers
    class CodeCommentStripper < Layer
      QUOTES = /^\s*(\/\/|#) /

      def call(text, width)
        wrapped = next_layer.call(stripped(text), width - quote(text).size)
        wrapped.lines.map { |line| quote(text) + line }.join("\n")
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
