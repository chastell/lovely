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
            and a hi-hat with a souped-up tempo
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
          call = HangoutWrapper.new(Spark).call("foobar baz\nqux", width: 7)
          call.should eq "✨ foobar\nbaz qux ✨"
        end

        it "recognises hangouts in lower lines" do
          text = <<-end
            ‘I beg your pardon—pray forgive me if I seem too bold,
            But you have breathed a name I knew familiarly of old. You
            spoke aloud of ROBINSON – I happened to be by— You know
            him?’ ‘Yes, extremely well.’ ‘Allow me – so do I!’
            end
          wrap = <<-end
            ‘I beg your pardon—pray forgive me if I seem too bold,
            But you have breathed a name I knew familiarly of old.
            You spoke aloud of ROBINSON – I happened to be by— You
            know him?’ ‘Yes, extremely well.’ ‘Allow me – so do I!’
            end
          HangoutWrapper.new.call(text, width: 72).should eq wrap
        end
      end
    end
  end
end
