require "./wrapper"

module Lovely
  class CLI
    private getter input : IO
    private getter output : IO
    private getter width = 72

    def initialize(@input, @output, @width)
    end

    def wrap
      output.puts Wrapper.new.call(input.to_s, width: width)
    end
  end
end
