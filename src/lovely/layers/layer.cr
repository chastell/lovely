module Lovely
  module Layers
    class Layer
      private getter next_layer : String, Int32 -> String

      def initialize(@next_layer = -> (text : String, width : Int32) { text })
      end
    end
  end
end
