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
          CodeCommentStripper.new.call(text).should eq text
        end

        it "does not touch non-commented texts" do
          text = <<-end
            my town, that created all the bass sound
            enough to shake and kick holes in the ground
            end
          CodeCommentStripper.new.call(text).should eq text
        end

        it "does not alter text contents" do
          text = "# Ice # Ice # Baby"
          CodeCommentStripper.new.call(text).should eq text
        end
      end
    end
  end
end
