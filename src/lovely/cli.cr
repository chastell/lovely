require "option_parser"
require "./wrapper"

module Lovely
  class CLI
    private getter input : IO
    private getter output : IO
    private getter width : Int32

    def initialize(args, @input, @output)
      @width = 72
      OptionParser.parse(args) do |parser|
        parser.banner = "Usage: lovely [options]"
        parser.on("-h", "--help", "Show this help") do
          output.puts parser
          exit
        end
        parser.on("-w", "--width=NUMBER", "Wrapping width") do |width|
          @width = width.to_i
        end
      end
    end

    def wrap
      output.puts Wrapper.new.call(input.gets_to_end, width: width)
    end
  end
end
