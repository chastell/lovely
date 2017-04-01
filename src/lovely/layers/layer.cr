module Lovely
  module Layers
    class Layer
      private getter next_layer : Layer | Layer.class

      def self.call(text, width = 72)
        new.call(text, width)
      end

      def initialize(@next_layer = Layer)
      end

      def call(text, width = 72)
        text
      end
    end
  end
end
