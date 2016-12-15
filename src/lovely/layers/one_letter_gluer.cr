require "./layer"

module Lovely
  module Layers
    class OneLetterGluer < Layer
      def call(text, width = 72)
        pattern = /(?<=\p{Zs})(&|\p{L})\p{Zs}/
        next_layer.call(text.gsub(pattern, "\\1\\2 "), width)
      end
    end
  end
end
