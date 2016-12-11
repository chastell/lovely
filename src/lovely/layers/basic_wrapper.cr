module Lovely
  module Layers
    class BasicWrapper
      @next_layer : String, Int32 -> String

      def initialize(@next_layer = -> (text : String, width : Int32) { text })
      end

      def call(text, width = 72)
        wrap = text.tr("\n", " ").strip.gsub(/(.{1,#{width}})( |$\n?)/, "\\1\n")
        @next_layer.call(wrap, width)
      end
    end
  end
end
