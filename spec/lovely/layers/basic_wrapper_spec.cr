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
          BasicWrapper.new.call(text, width: 22).should eq wrap
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
          BasicWrapper.new.call(text, width: 5).should eq wrap
        end

        it "rewraps a String from zero" do
          text = <<-end
            turn off
            the lights and I’ll glow
            end
          wrap = "turn off the lights and I’ll glow"
          BasicWrapper.new.call(text, width: 72).should eq wrap
        end

        it "passes the fixed text to the next layer and returns its outcome" do
          call = BasicWrapper.new(Spark).call("I O U", width: 2)
          call.should eq "✨ I\nO\nU ✨"
        end
      end
    end
  end
end
