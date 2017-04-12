require "../../spec_helper"
require "../../../src/lovely/layers/email_quote_stripper"

module Lovely
  module Layers
    describe EmailQuoteStripper do
      describe "#call" do
        it "adds quotes back in (and adjusts width) before returning" do
          quoted = <<-end
            > take heed, ’cause I’m a lyrical poet
            > Miami’s on the scene just in case you didn’t know it
            end
          EmailQuoteStripper.new.call(quoted, 72).should eq quoted
        end

        it "does not touch non-quoted texts" do
          plain = <<-end
            my town, that created all the bass sound
            enough to shake and kick holes in the ground
            end
          EmailQuoteStripper.new.call(plain, 72).should eq plain
        end

        it "does not alter text contents" do
          plain = "> Ice > Ice > Baby"
          EmailQuoteStripper.new.call(plain, 72).should eq plain
        end

        it "strips multilevel quotes" do
          quoted = <<-end
            >> ’cause my style’s like a chemical spill
            >> feasible rhymes that you can vision and feel
            end
          EmailQuoteStripper.new.call(quoted, 72).should eq quoted
        end

        it "fixes broken quotes when adding them back in" do
          quoted = <<-end
            > > >Shay plays on the fade,
            > > >slice like a ninja
            > > >cut like a razor blade
            end
          fixed = <<-end
            >>> Shay plays on the fade,
            >>> slice like a ninja
            >>> cut like a razor blade
            end
          EmailQuoteStripper.new.call(quoted, 72).should eq fixed
        end
      end
    end
  end
end
