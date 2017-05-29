module Lovely
  module Layers
    class Layer
      private NBSP = ' '

      private getter next_layer : Layer | Layer.class
      private getter text = ""
      private getter width = 72

      def self.call(text, width)
        new.call(text, width)
      end

      def initialize(@next_layer = Layer)
      end

      def call(text, width)
        text
      end
    end
  end
end
