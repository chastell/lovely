require "../spec_helper"
require "../../src/lovely/cli"

module Lovely
  describe CLI do
    describe ".new" do
      it "prints help on -h and --help" do
        %w[-h --help].each do |flag|
          input = IO::Memory.new("")
          output = IO::Memory.new
          usage = <<-end
            Usage: lovely [options]
                -h, --help                       Show this help
                -w, --width=NUMBER               Wrapping width

            end
          CLI.new([flag], input: input, output: output)
          output.to_s.should eq usage
        end
      end
    end

    describe "#wrap" do
      it "wraps the input to the given -w/--width and prints to output" do
        ["-w 7", "--width=7"].map(&.split(' ')).each do |args|
          input = IO::Memory.new("Ice Ice Baby\n")
          output = IO::Memory.new
          wrapped = CLI.new(args, input: input, output: output).wrap
          output.to_s.should eq "Ice Ice\nBaby\n"
        end
      end
    end
  end
end
