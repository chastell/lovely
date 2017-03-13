require "../../spec_helper"
require "../../../src/lovely/layers/one_letter_gluer"

module Lovely
  module Layers
    describe OneLetterGluer do
      describe "#call" do
        it "replaces spaces after one-letter words with non-break spaces" do
          text = "I go crazy when I hear a cymbal and a hi-hat"
          glue = "I go crazy when I hear a cymbal and a hi-hat"
          OneLetterGluer.new.call(text, width: 42).should eq glue
        end
      end
    end
  end
end
