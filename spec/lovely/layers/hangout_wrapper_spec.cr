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
          HangoutWrapper.new.call(text, width: 35).should eq wrap
        end

        it "doesn’t let the last line to hang out" do
          text = <<-end
            Just found out the Finnish term for grammar Nazi is pilkunnussija.
            Direct translation: comma fucker. You’re welcome.
            end
          HangoutWrapper.new.call(text, width: 76).should eq text
        end
      end
    end
  end
end
