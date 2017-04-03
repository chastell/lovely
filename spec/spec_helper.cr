require "spec"
require "../src/lovely/layers/layer"

class Spark < Lovely::Layers::Layer
  def call(text, width)
    "✨ #{text} ✨"
  end
end
