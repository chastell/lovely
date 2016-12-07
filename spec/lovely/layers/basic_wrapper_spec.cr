require "../../spec_helper"
require "../../../src/lovely/layers/basic_wrapper"

module Lovely
  module Layers
    describe BasicWrapper do
      describe "#call" do
        it "wraps text to the given width" do
          text = "I go crazy when I hear a cymbal and a hi-hat " \
            "with a souped-up tempo"
          wrap = <<-end
            I go crazy when I hear
            a cymbal and a hi-hat
            with a souped-up tempo

            end
          __(BasicWrapper.new(text, width: 22).call).must_equal wrap
        end
      end
    end
  end
end
