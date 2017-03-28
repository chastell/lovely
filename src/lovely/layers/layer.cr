module Lovely
  module Layers
    class Layer
      private getter next_layer : Layer | (String, Int32 -> String)

      def initialize(@next_layer = -> (text : String, width : Int32) { text })
      end

      def call(text, width = 72)
        text
      end
    end
  end
end
