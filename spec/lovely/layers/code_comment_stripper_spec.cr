require "../../spec_helper"
require "../../../src/lovely/layers/code_comment_stripper"

module Lovely
  module Layers
    describe CodeCommentStripper do
      describe "#call" do
        it "adds comments back in (and adjusts width) before returning" do
          text = <<-end
            # take heed, ’cause I’m a lyrical poet
            # Miami’s on the scene just in case you didn’t know it
            end
          CodeCommentStripper.new.call(text, width: 72).should eq text
        end

        it "does not touch non-commented texts" do
          text = <<-end
            my town, that created all the bass sound
            enough to shake and kick holes in the ground
            end
          CodeCommentStripper.new.call(text, width: 72).should eq text
        end

        it "does not alter text contents" do
          text = "# Ice # Ice # Baby"
          CodeCommentStripper.new.call(text, width: 72).should eq text
        end

        it "strips // code comments (and adds them back before returning)" do
          commented = <<-end
            // so fast other DJs say ‘damn!’
            // if my rhyme was a drug I’d sell it by the gram
            end
          sparked = <<-end
            // ✨ so fast other DJs say ‘damn!’
            // if my rhyme was a drug I’d sell it by the gram ✨
            end
          CodeCommentStripper.new(Spark).call(commented, 72).should eq sparked
        end

        it "only considers homogenous characters as comments" do
          commented = <<-end
            # /if there was a problem,
            # yo – I’ll solve it!/
            end
          sparked = <<-end
            # ✨ /if there was a problem,
            # yo – I’ll solve it!/ ✨
            end
          CodeCommentStripper.new(Spark).call(commented, 72).should eq sparked
        end

        it "strips initial space indentation" do
          commented = "  // check out the hook"
          sparked   = "  // ✨ check out the hook ✨"
          CodeCommentStripper.new(Spark).call(commented, 72).should eq sparked
        end

        it "strips initial tab indentation" do
          commented = "\t# while my DJ revolves it"
          sparked   = "\t# ✨ while my DJ revolves it ✨"
          CodeCommentStripper.new(Spark).call(commented, 72).should eq sparked
        end
      end
    end
  end
end
