require "./wrapper"

module Lovely
  class CLI
    def wrap(text, width)
      Wrapper.new.call(text.to_s, width: width)
    end
  end
end
