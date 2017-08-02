require "../spec_helper"
require "../../src/lovely/cli"

module Lovely
  describe CLI do
    describe "#wrap" do
      it "wraps the input to the given width and prints to output" do
        input = IO::Memory.new("Ice Ice Baby\n")
        output = IO::Memory.new
        wrapped = CLI.new(%w[-w 7], input: input, output: output).wrap
        output.to_s.should eq "Ice Ice\nBaby\n"
      end
    end
  end
end
