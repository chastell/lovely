require "../../spec_helper"
require "../../../src/lovely/layers/hangout_wrapper"

module Lovely
  module Layers
    describe HangoutWrapper do
      describe "#call" do
        it "removes hangouts from the text" do
          text = <<-end
            I go crazy when I hear a cymbal and
            a hi-hat with a souped-up tempo
            end
          wrap = <<-end
            I go crazy when I hear a cymbal
            and a hi-hat with a souped-up tempo
            end
          __(HangoutWrapper.new.call(text, width: 35)).must_equal wrap
        end
      end
    end
  end
end
