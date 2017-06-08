require "../../spec_helper"
require "../../../src/lovely/layers/basic_wrapper"
require "../../../src/lovely/layers/code_comment_stripper"

module Lovely
  module Layers
    describe CodeCommentStripper do
      describe "#call" do
        it "strips comments and adjusts width before calling the next layer" do
          commented = <<-end
            # to the extreme I rock a mic like a vandal
            # light up a stage and wax a chump like a candle
            end
          rewrapped = <<-end
            # to the extreme I rock a mic
            # like a vandal light up a stage
            # and wax a chump like a candle
            end
          stripper = CodeCommentStripper.new(BasicWrapper)
          stripper.call(commented, 32).should eq rewrapped
        end

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
          sparked = "  // ✨ check out the hook ✨"
          CodeCommentStripper.new(Spark).call(commented, 72).should eq sparked
        end

        it "strips initial tab indentation" do
          commented = "\t# while my DJ revolves it"
          sparked = "\t# ✨ while my DJ revolves it ✨"
          CodeCommentStripper.new(Spark).call(commented, 72).should eq sparked
        end

        it "pays proper homage to K&R" do
          defined = "#define ASSERT(msg, cond) // TODO"
          sparked = "✨ #define ASSERT(msg, cond) // TODO ✨"
          CodeCommentStripper.new(Spark).call(defined, 72).should eq sparked
        end
      end
    end
  end
end
