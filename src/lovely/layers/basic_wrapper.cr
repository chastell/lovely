require "./layer"

module Lovely
  module Layers
    class BasicWrapper < Layer
      def call(text, width = 72)
        wrap = text.tr("\n", " ").strip.gsub(/(.{1,#{width}})( |$\n?)/, "\\1\n")
        next_layer.call(wrap.chomp, width)
      end
    end
  end
end
