require "./layer"

module Lovely
  module Layers
    class OneLetterGluer < Layer
      def call(text, width)
        pattern = /(?<=\p{Zs})(&|\p{L})\p{Zs}/
        next_layer.call(text.gsub(pattern, "\\1\\2#{NBSP}"), width)
      end
    end
  end
end
