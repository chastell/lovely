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
          __(BasicWrapper.new.call(text, width: 22)).must_equal wrap
        end

        it "extends past the given width when necessary" do
          text = "I’m killing your brain like a poisonous mushroom"
          wrap = <<-end
            I’m
            killing
            your
            brain
            like
            a
            poisonous
            mushroom

            end
          __(BasicWrapper.new.call(text, width: 5)).must_equal wrap
        end

        it "rewraps a String from zero" do
          text = <<-end
            turn off
            the lights and I’ll glow

            end
          wrap = "turn off the lights and I’ll glow\n"
          __(BasicWrapper.new.call(text)).must_equal wrap
        end
      end
    end
  end
end
