require "../spec_helper"
require "../../src/lovely/cli"

module Lovely
  describe CLI do
    describe ".new" do
      it "prints help on --help and -h" do
        input = IO::Memory.new("")
        output = IO::Memory.new
        wrapped = CLI.new(%w[--help], input: input, output: output)
        usage = <<-end
          Usage: lovely [options]
              -h, --help                       Show this help
              -w, --width=NUMBER               Wrapping width

          end
        output.to_s.should eq usage
      end
    end

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
