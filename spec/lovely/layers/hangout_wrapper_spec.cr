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

        it "passes the fixed text to the next layer and returns its outcome" do
          spark = -> (text : String, width : Int32) { "✨ #{text} ✨" }
          call = HangoutWrapper.new(spark).call("foobar baz\nqux", width: 7)
          call.should eq "✨ foobar\nbaz qux ✨"
        end
      end
    end
  end
end
