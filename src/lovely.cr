require "./lovely/wrapper"

module Lovely
  def self.wrap(text, width = 72, wrapper = Wrapper.new)
    wrapper.wrap(text, width: width)
  end
end
