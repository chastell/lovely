require "../spec_helper"
require "../../src/lovely/cli"

module Lovely
  describe CLI do
    describe "#wrap" do
      it "wraps the passed IO to the given width" do
        wrapped = CLI.new.wrap(IO::Memory.new("Ice Ice Baby"), width: 7)
        wrapped.should eq "Ice Ice\nBaby"
      end
    end
  end
end
