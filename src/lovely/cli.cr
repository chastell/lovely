require "./wrapper"

module Lovely
  class CLI
    def wrap(input, output, width)
      output.puts Wrapper.new.call(input.to_s, width: width)
    end
  end
end
