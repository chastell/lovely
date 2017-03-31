require "spec"
require "../src/lovely/layers/layer"

class Spark < Lovely::Layers::Layer
  def call(text, width = 72)
    "✨ #{text} ✨"
  end
end
