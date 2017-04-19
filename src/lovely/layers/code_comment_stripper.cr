require "./quote_stripper"

module Lovely
  module Layers
    class CodeCommentStripper < QuoteStripper
      private def quotes
        /^\s*(\/\/|#) /
      end
    end
  end
end
